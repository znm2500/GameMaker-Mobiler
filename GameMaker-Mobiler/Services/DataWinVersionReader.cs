using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace GameMaker_Mobiler.Services;

/// <summary>
/// 从 GameMaker data.win / data.unx / data.ios / data.droid 文件解析出的版本信息。
/// 解析逻辑对齐 UndertaleModLib 的 UndertaleGeneralInfo + TestForCommonGMSVersions。
/// </summary>
public sealed record DataWinVersion(
    uint Major,
    uint Minor,
    uint Release,
    uint Build,
    byte BytecodeVersion,
    bool IsGameMaker2,
    bool IsValid,
    string DisplayVersion,
    string RawGen8Version,
    string ChunkNameFloor,
    string StructuralFloor)
{
    public override string ToString() => DisplayVersion;
}

/// <summary>
/// 优先通过 UndertaleModCli 的完整 reader 获取版本，保证对齐 UndertaleModTool
/// 分散在各个 chunk/model 中的版本修正。CLI 不可用或读取失败时，回落到本文件内的轻量启发式。
/// </summary>
public static class DataWinVersionReader
{
    private const string FormMagic = "FORM";
    private const string Gen8ChunkName = "GEN8";
    private const int Gen8VersionOffset = 44;

    /// <summary>解析 data.win。失败时返回 <see cref="Invalid"/>。</summary>
    /// <exception cref="FileNotFoundException">文件不存在。</exception>
    public static DataWinVersion Read(string dataWinPath)
    {
        var fallbackVersion = ReadWithBuiltInHeuristics(dataWinPath);
        var utmtVersion = TryReadWithUndertaleModCli(dataWinPath, fallbackVersion);

        return utmtVersion ?? fallbackVersion;
    }

    private static DataWinVersion ReadWithBuiltInHeuristics(string dataWinPath)
    {
        if (!File.Exists(dataWinPath))
            throw new FileNotFoundException("data file not found", dataWinPath);

        using var fs = File.OpenRead(dataWinPath);
        using var br = new BinaryReader(fs, Encoding.ASCII, leaveOpen: true);

        if (!TryReadExact(br, 4, out var magicBytes) || Encoding.ASCII.GetString(magicBytes) != FormMagic)
            return Invalid;
        if (fs.Position + 4 > fs.Length)
            return Invalid;
        uint formLength = br.ReadUInt32();
        long formDataStart = fs.Position;   // FORM 数据起始（chunk 内部指针基准之一）
        long fileEnd = fs.Length;

        var allChunkNames = new HashSet<string>(StringComparer.Ordinal);
        long gen8DataStart = -1;
        // 记录关键 chunk 的数据区起点与长度，便于后续结构级检测
        var chunkData = new Dictionary<string, (long DataStart, uint DataLen)>(StringComparer.Ordinal);

        while (fs.Position + 8 <= fileEnd)
        {
            var nameBytes = br.ReadBytes(4);
            if (nameBytes.Length < 4) break;
            var chunkName = Encoding.ASCII.GetString(nameBytes);
            uint chunkLen = br.ReadUInt32();
            long dataStart = fs.Position;

            if (chunkName == Gen8ChunkName) gen8DataStart = dataStart;
            allChunkNames.Add(chunkName);
            chunkData[chunkName] = (dataStart, chunkLen);

            if (chunkName == FormMagic) continue; // 根已在开头读过

            long next = dataStart + chunkLen;
            if (next < 0 || next > fileEnd) next = fileEnd;
            fs.Position = next;
        }

        if (gen8DataStart < 0)
            return Invalid;

        // ---------- 1. 读取 GEN8：BytecodeVersion + 原始 Version ----------
        fs.Position = gen8DataStart;
        if (fs.Position + Gen8VersionOffset + 16 > fileEnd)
            return Invalid;

        _ = br.ReadByte();                       // IsDebuggerDisabled
        byte bytecodeVersion = br.ReadByte();
        fs.Position = gen8DataStart + Gen8VersionOffset;
        uint rawMajor = br.ReadUInt32();
        uint rawMinor = br.ReadUInt32();
        uint rawRelease = br.ReadUInt32();
        uint rawBuild = br.ReadUInt32();

        string rawGen8Display = $"{rawMajor}.{rawMinor}.{rawRelease}.{rawBuild}";

        // ---------- 2. 特征 chunk 名：只取 >= 当前值的下限 ----------
        var (m, n, r, b) = (rawMajor, rawMinor, rawRelease, rawBuild);
        string chunkFloorApplied = "(none)";

        foreach (var (name, vm, vn, vr, vb) in ChunkVersionFloors())
        {
            if (!allChunkNames.Contains(name)) continue;
            if (CompareVersion(vm, vn, vr, vb, m, n, r, b) <= 0) continue;
            (m, n, r, b) = (vm, vn, vr, vb);
            chunkFloorApplied = $"{name}→{FormatShort(vm, vn, vr, vb)}";
            break; // 数组从新到旧，遇到第一个命中即可退出（UILR 覆盖 PSEM 等）
        }

        // ---------- 3. 结构级启发式（只升不降）----------
        string structuralApplied = "(none)";

        // 3a. SOND chunk → 2024.6（音频 entry 间隙：旧布局 9*4=36 字节，2024.6 额外有 4 字节）
        if (chunkData.TryGetValue("SOND", out var sondInfo))
        {
            bool sond2024_6 = CheckSond2024_6(fs, br, sondInfo.DataStart, sondInfo.DataLen, formDataStart, fileEnd);
            if (sond2024_6 && CompareVersion(2024, 6, 0, 0, m, n, r, b) > 0)
            {
                (m, n, r, b) = (2024, 6, 0, 0);
                structuralApplied = "SOND→2024.6";
            }
        }

        // 3b. AGRP chunk → 2024.14（UndertaleAudioGroup 末尾新增 4 字节 AudioGroupPathPtr）
        if (chunkData.TryGetValue("AGRP", out var agrpInfo))
        {
            bool agrp2024_14 = CheckAgrp2024_14(fs, br, agrpInfo.DataStart, agrpInfo.DataLen, formDataStart, fileEnd);
            if (agrp2024_14 && CompareVersion(2024, 14, 0, 0, m, n, r, b) > 0)
            {
                (m, n, r, b) = (2024, 14, 0, 0);
                structuralApplied = structuralApplied == "(none)"
                    ? "AGRP→2024.14"
                    : structuralApplied + " + AGRP→2024.14";
            }
        }

        // 全 0 且 bytecode=0 → 无效
        if (m == 0 && n == 0 && r == 0 && b == 0 && bytecodeVersion == 0)
            return Invalid;

        bool isGms2 = m >= 2;
        string displayVersion = FormatDisplayVersion(m, n, r, b, bytecodeVersion);

        return new DataWinVersion(
            Major: m, Minor: n, Release: r, Build: b,
            BytecodeVersion: bytecodeVersion,
            IsGameMaker2: isGms2,
            IsValid: true,
            DisplayVersion: displayVersion,
            RawGen8Version: rawGen8Display,
            ChunkNameFloor: chunkFloorApplied,
            StructuralFloor: structuralApplied);
    }

    /// <summary>
    /// 对齐 UndertaleGeneralInfo.TestForCommonGMSVersions 的 chunk 下限表，
    /// 顺序：从新到旧。每项只用作「最低下限」（超过当前版本时才采用）。
    /// </summary>
    private static IEnumerable<(string Chunk, uint M, uint N, uint R, uint B)> ChunkVersionFloors()
    {
        yield return ("UILR", 2024, 13, 0, 0);
        yield return ("PSEM", 2023, 2, 0, 0);
        yield return ("FEAT", 2022, 8, 0, 0);
        yield return ("FEDS", 2, 3, 6, 0);
        yield return ("SEQN", 2, 3, 0, 0);
        yield return ("TGIN", 2, 2, 1, 0);
    }

    /// <summary>
    /// SOND chunk → 2024.6 检测（对齐 UndertaleChunkSOND.CheckForGM2024_6）。
    /// 2024.6 起 UndertaleSound 在 9 个 uint32 字段之后又追加了 4 字节字段，
    /// 因此如果第 0 个 entry 起始 + 36 正好等于第 1 个 entry 起始 - 4，
    /// 说明中间正好插进了新字段 → 判定为 2024.6。
    /// </summary>
    private static bool CheckSond2024_6(Stream fs, BinaryReader br,
                                        long sondDataStart, uint sondDataLen,
                                        long formDataStart, long fileEnd)
    {
        if (sondDataStart + 4 > formDataStart + sondDataStart + sondDataLen) return false;
        fs.Position = sondDataStart;
        uint count = br.ReadUInt32();
        if (count == 0 || count > 1_000_000) return false; // 防御性上限

        var ptrs = new List<uint>((int)Math.Min(count, 3));
        for (uint i = 0; i < count && ptrs.Count < 3; i++)
        {
            if (fs.Position + 4 > fileEnd) break;
            uint p = br.ReadUInt32();
            if (p != 0) ptrs.Add(p);
        }

        if (ptrs.Count >= 2)
        {
            // 对照 UTMT: soundPtrs[0] + 9*4 == soundPtrs[1] - 4
            long p0 = ResolvePointer(ptrs[0], formDataStart);
            long p1 = ResolvePointer(ptrs[1], formDataStart);
            return (p0 + 36) == (p1 - 4);
        }
        else if (ptrs.Count == 1)
        {
            long p0 = ResolvePointer(ptrs[0], formDataStart);
            long checkPos = p0 + 36;
            // UTMT 要求 checkPos % 16 == 4（16 字节对齐后第 4 字节处，即 padding 区）
            // 这里宽松处理：如果越界则跳过
            if (checkPos < 0 || checkPos + 4 > fileEnd) return false;
            fs.Position = checkPos;
            uint val = br.ReadUInt32();
            return val != 0;
        }

        return false;
    }

    /// <summary>
    /// AGRP chunk → 2024.14 检测（对齐 UndertaleChunkAGRP.CheckForGM2024_14）。
    /// 2024.14 起 UndertaleAudioGroup 新增 4 字节 AudioGroupPathPtr：
    ///   - 只有 1 个音频组：音频组 Name 指针之后的 4 字节非 0 → 2024.14
    ///   - ≥2 个音频组：两组指针间距不再等于旧版的"组大小"时为 2024.14；
    ///     UTMT 用"间距恰好 == 4 则不是 2024.14"作快速排除，其余情况判定为 2024.14。
    /// </summary>
    private static bool CheckAgrp2024_14(Stream fs, BinaryReader br,
                                          long agrpDataStart, uint agrpDataLen,
                                          long formDataStart, long fileEnd)
    {
        long chunkEnd = agrpDataStart + agrpDataLen;
        if (agrpDataStart + 4 > chunkEnd || agrpDataStart + 4 > fileEnd) return false;
        fs.Position = agrpDataStart;
        uint count = br.ReadUInt32();
        if (count == 0 || count > 1_000_000) return false;

        uint firstPtr = 0, secondPtr = 0;
        uint i = 0;
        while (i < count)
        {
            if (fs.Position + 4 > Math.Min(chunkEnd, fileEnd)) return false;
            firstPtr = br.ReadUInt32(); i++;
            if (firstPtr != 0) break;
        }
        if (firstPtr == 0) return false;

        while (i < count)
        {
            if (fs.Position + 4 > Math.Min(chunkEnd, fileEnd)) return false;
            secondPtr = br.ReadUInt32(); i++;
            if (secondPtr != 0) break;
        }

        long firstPos = ResolvePointer(firstPtr, formDataStart);
        long secondPos = ResolvePointer(secondPtr, formDataStart);

        if (secondPtr == 0)
        {
            // 单组情况：Name 指针（前 4 字节）之后读 4 字节判断是否非 0
            long checkPos = firstPos + 4;
            if (checkPos < 0 || checkPos + 4 > fileEnd) return false;
            fs.Position = checkPos;
            uint pathPtr = br.ReadUInt32();
            return pathPtr != 0;
        }
        else
        {
            // ≥2 组：间距恰好 == 4 视为旧版（非 2024.14）；其他情况判为 2024.14
            // （指针用 uint 减法：若 second < first 则会下溢，但 UTMT 原本也直接做减法）
            uint diff = unchecked(secondPtr - firstPtr);
            return diff != 4;
        }
    }

    /// <summary>
    /// 指针坐标归一化：
    ///   UTMT 内部 reader.AbsPosition 按「FORM 数据区开头 + Position 相对偏移」计算指针；
    ///   但在不同版本/序列化器下也可能直接存储为文件偏移。
    ///   本方法按「是否落在文件有效区间 + FORM 数据区之后」启发式选择。
    /// </summary>
    private static long ResolvePointer(uint ptr, long formDataStart)
    {
        if (ptr == 0) return 0;
        long asIs = ptr;                        // 文件绝对（UTMT 的 AbsPosition 体系）
        long asFormRel = formDataStart + ptr;   // FORM 数据区相对（GM 数据格式常见）
        // 大多数情况下两种值不会同时落在合理区间：小值 + 大文件更可能是 formRel
        return asIs < asFormRel ? asFormRel : asIs;
    }

    /// <summary>按 Major→Minor→Release→Build 比较版本（与 UndertaleData.IsVersionAtLeast 同序）。</summary>
    private static int CompareVersion(uint m1, uint n1, uint r1, uint b1,
                                       uint m2, uint n2, uint r2, uint b2)
    {
        int c;
        if ((c = m1.CompareTo(m2)) != 0) return c;
        if ((c = n1.CompareTo(n2)) != 0) return c;
        if ((c = r1.CompareTo(r2)) != 0) return c;
        return b1.CompareTo(b2);
    }

    private static string FormatShort(uint m, uint n, uint r, uint b)
    {
        if (m >= 2022)
        {
            var sb = new StringBuilder();
            sb.Append(m);
            if (n != 0) { sb.Append('.').Append(n); if (r != 0) { sb.Append('.').Append(r); if (b != 0) sb.Append('.').Append(b); } }
            return sb.ToString();
        }
        return $"{m}.{n}.{r}.{b}";
    }

    private static string FormatDisplayVersion(uint major, uint minor, uint release, uint build, byte bytecodeVersion)
    {
        string engine = major >= 2 ? "GMS2" : "GMS1";

        string versionCore;
        if (major == 1)
        {
            versionCore = $"{major}.{minor}.{release}.{build}";
        }
        else if (major < 2022)
        {
            versionCore = build == 0
                ? $"{major}.{minor}.{release}"
                : $"{major}.{minor}.{release}.{build}";
        }
        else
        {
            var sb = new StringBuilder();
            sb.Append(major);
            if (minor != 0)
            {
                sb.Append('.').Append(minor);
                if (release != 0)
                {
                    sb.Append('.').Append(release);
                    if (build != 0)
                        sb.Append('.').Append(build);
                }
            }
            versionCore = sb.ToString();
        }

        return $"{engine} {versionCore} (bytecode {bytecodeVersion})";
    }

    private static bool TryReadExact(BinaryReader br, int count, out byte[] buffer)
    {
        buffer = br.ReadBytes(count);
        return buffer.Length == count;
    }

    /// <summary>解析失败的占位版本信息。</summary>
    public static DataWinVersion Invalid { get; } = new(
        Major: 0, Minor: 0, Release: 0, Build: 0,
        BytecodeVersion: 0,
        IsGameMaker2: false,
        IsValid: false,
            DisplayVersion: "Unknown",
            RawGen8Version: "-",
            ChunkNameFloor: "(none)",
            StructuralFloor: "(none)");

    private static DataWinVersion? TryReadWithUndertaleModCli(string dataWinPath, DataWinVersion fallbackVersion)
    {
        var utmtCliPath = GetUtmtCliPath();
        if (!File.Exists(utmtCliPath))
            return null;

        using var process = new Process();
        process.StartInfo = new ProcessStartInfo
        {
            FileName = utmtCliPath,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            StandardOutputEncoding = System.Text.Encoding.UTF8,
            StandardErrorEncoding = System.Text.Encoding.UTF8,
            CreateNoWindow = true,
            UseShellExecute = false,
            WorkingDirectory = Path.GetDirectoryName(utmtCliPath) ?? AppDomain.CurrentDomain.BaseDirectory
        };

        process.StartInfo.ArgumentList.Add("load");
        process.StartInfo.ArgumentList.Add(dataWinPath);
        process.StartInfo.ArgumentList.Add("-l");
        process.StartInfo.ArgumentList.Add(
            "Console.WriteLine(\"__GMM_VERSION__=\" + " +
            "Data.GeneralInfo.Major + \".\" + Data.GeneralInfo.Minor + \".\" + " +
            "Data.GeneralInfo.Release + \".\" + Data.GeneralInfo.Build + \"|\" + " +
            "Data.GeneralInfo.BytecodeVersion + \"|\" + Data.IsGameMaker2());");

        try
        {
            if (!process.Start())
                return null;

            var stdoutTask = process.StandardOutput.ReadToEndAsync();
            var stderrTask = process.StandardError.ReadToEndAsync();

            if (!process.WaitForExit(120_000))
            {
                try
                {
                    process.Kill(entireProcessTree: true);
                }
                catch
                {
                    // Ignore kill errors.
                }

                return null;
            }

            string stdout = stdoutTask.GetAwaiter().GetResult();
            _ = stderrTask.GetAwaiter().GetResult();

            if (process.ExitCode != 0)
                return null;

            return ParseUtmtVersion(stdout, fallbackVersion);
        }
        catch
        {
            return null;
        }
    }

    private static DataWinVersion? ParseUtmtVersion(string stdout, DataWinVersion fallbackVersion)
    {
        const string marker = "__GMM_VERSION__=";

        using var reader = new StringReader(stdout);
        string? line;
        while ((line = reader.ReadLine()) is not null)
        {
            int markerIndex = line.IndexOf(marker, StringComparison.Ordinal);
            if (markerIndex < 0)
                continue;

            string payload = line[(markerIndex + marker.Length)..].Trim();
            string[] parts = payload.Split('|');
            if (parts.Length < 3)
                return null;

            string[] versionParts = parts[0].Split('.');
            if (versionParts.Length != 4 ||
                !uint.TryParse(versionParts[0], out uint major) ||
                !uint.TryParse(versionParts[1], out uint minor) ||
                !uint.TryParse(versionParts[2], out uint release) ||
                !uint.TryParse(versionParts[3], out uint build) ||
                !byte.TryParse(parts[1], out byte bytecodeVersion) ||
                !bool.TryParse(parts[2], out bool isGameMaker2))
            {
                return null;
            }

            return new DataWinVersion(
                Major: major,
                Minor: minor,
                Release: release,
                Build: build,
                BytecodeVersion: bytecodeVersion,
                IsGameMaker2: isGameMaker2,
                IsValid: true,
                DisplayVersion: FormatDisplayVersion(major, minor, release, build, bytecodeVersion),
                RawGen8Version: fallbackVersion.RawGen8Version,
                ChunkNameFloor: fallbackVersion.ChunkNameFloor,
                StructuralFloor: "UndertaleModTool full reader");
        }

        return null;
    }

    private static string GetUtmtCliPath()
    {
        return Path.GetFullPath(Path.Combine(
            AppDomain.CurrentDomain.BaseDirectory,
            "..", "..", "..", "..",
            "Tools", "UTMT_CLI_v0.9.1.2-Windows", "UndertaleModCli.exe"));
    }
}
