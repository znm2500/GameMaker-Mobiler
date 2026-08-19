using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;

namespace GameMaker_Mobiler.Services;

public sealed class UtmtService
{
    private readonly Action<string, bool>? _log;

    public UtmtService(Action<string, bool>? log = null)
    {
        _log = log;
    }

    public Task ModifyDataWin(string dataWinPath, bool[] options)
    {
        return ModifyDataWin(dataWinPath, options, null, CancellationToken.None);
    }

    public Task ModifyDataWin(string dataWinPath, bool[] options, string? outputFileName)
    {
        return ModifyDataWin(dataWinPath, options, outputFileName, CancellationToken.None);
    }

    public Task ModifyDataWin(string dataWinPath, bool[] options, CancellationToken cancellationToken)
    {
        return ModifyDataWin(dataWinPath, options, null, cancellationToken);
    }

    public async Task ModifyDataWin(string dataWinPath, bool[] options, string? outputFileName, CancellationToken cancellationToken)
    {
        var gameDir = Path.GetDirectoryName(dataWinPath) ?? string.Empty;
        var outputPath = string.IsNullOrEmpty(outputFileName)
            ? dataWinPath
            : Path.Combine(gameDir, outputFileName);

        await ModifyDataWinToPath(dataWinPath, options, outputPath, cancellationToken)
            .ConfigureAwait(false);
    }

    public Task ModifyDataWinToPath(
        string dataWinPath,
        bool[] options,
        string outputPath,
        CancellationToken cancellationToken)
    {
        return ModifyDataWinToPathCore(dataWinPath, options, outputPath, cancellationToken);
    }

    private async Task ModifyDataWinToPathCore(
        string dataWinPath,
        bool[] options,
        string finalOutputPath,
        CancellationToken cancellationToken)
    {
        if (!File.Exists(dataWinPath))
        {
            throw new FileNotFoundException("data.win not found", dataWinPath);
        }

        if (options is null || options.Length < 5)
        {
            throw new ArgumentException("options must contain 5 values", nameof(options));
        }

        var utmtCliPath = GetUtmtCliPath();
        if (!File.Exists(utmtCliPath))
        {
            throw new FileNotFoundException("UndertaleModCli.exe not found", utmtCliPath);
        }

        var addMobileKey = options[0];
        var mobileF2 = options[1];
        var mobileHeal = options[2];
        var mobileCn = options[3];
        var androidSystemKeyboard = options[4];

        var gameDir = Path.GetDirectoryName(dataWinPath) ?? string.Empty;
        var isUte = DetectUteTemplate(gameDir);

        var workingDirectory = Path.Combine(Path.GetTempPath(), $"gmm_utmt_{Guid.NewGuid():N}");
        Directory.CreateDirectory(workingDirectory);
        var workingOutputPath = Path.Combine(workingDirectory, Path.GetFileName(finalOutputPath));

        // 获取游戏版本用于选择 UTE 修复脚本
        var (majorVer, minorVer) = ReadVersionFromDataWin(dataWinPath);

        var tempGmlPath = Path.Combine(Path.GetTempPath(), $"gmm_mobile_{Guid.NewGuid():N}.gml");
        try
        {
            File.Copy(dataWinPath, workingOutputPath, overwrite: true);

            // Step 1: Mobile 集成脚本（任何游戏均可执行）
            if (addMobileKey)
            {
                var integrationScriptPath = GetIntegrationScriptPath();
                if (!File.Exists(integrationScriptPath))
                {
                    throw new FileNotFoundException("Mobile integration script not found", integrationScriptPath);
                }

                _log?.Invoke("执行 Mobile 集成脚本...", false);
                await RunUtmtProcessAsync(
                    utmtCliPath,
                    ["load", workingOutputPath, "-s", integrationScriptPath, "-o", workingOutputPath],
                    cancellationToken).ConfigureAwait(false);
            }
            else
            {
                _log?.Invoke("主开关未启用：跳过 Mobile 集成脚本。", false);
            }

            // Step 2: UTE 修复脚本（自动检测，仅 UTE 模板游戏执行）
            if (isUte)
            {
                var uteRepairScriptPath = GetUteRepairScriptPathByVersion(majorVer, minorVer);
                if (!File.Exists(uteRepairScriptPath))
                {
                    throw new FileNotFoundException($"UTE repair script not found: {uteRepairScriptPath}", uteRepairScriptPath);
                }

                _log?.Invoke($"检测到 UTE 模板游戏，执行 UTE 修复脚本: {Path.GetFileName(uteRepairScriptPath)}", false);
                await RunUtmtProcessAsync(
                    utmtCliPath,
                    ["load", workingOutputPath, "-s", uteRepairScriptPath, "-o", workingOutputPath],
                    cancellationToken).ConfigureAwait(false);
            }
            else
            {
                _log?.Invoke("非 UTE 模板游戏，跳过 UTE 修复脚本。", false);
            }

            var templatePath = GetMobileContTemplatePath();
            if (!File.Exists(templatePath))
            {
                throw new FileNotFoundException("Template gml not found", templatePath);
            }

            var templateContent = await File.ReadAllTextAsync(templatePath, cancellationToken).ConfigureAwait(false);
            var patchedContent = PatchMobileGlobals(templateContent, addMobileKey, mobileF2, mobileHeal, mobileCn, androidSystemKeyboard);

            await File.WriteAllTextAsync(tempGmlPath, patchedContent, cancellationToken).ConfigureAwait(false);

            _log?.Invoke($"写入全局变量配置到 {Path.GetFileName(workingOutputPath)}...", false);
            await RunUtmtProcessAsync(
                utmtCliPath,
                ["replace", workingOutputPath, "-c", $"gml_Object_mb_cont_mobile_Create_0={tempGmlPath}", "-o", workingOutputPath],
                cancellationToken).ConfigureAwait(false);

            if (!string.Equals(workingOutputPath, finalOutputPath, StringComparison.OrdinalIgnoreCase))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(finalOutputPath)!);
                File.Copy(workingOutputPath, finalOutputPath, overwrite: true);
            }

            _log?.Invoke($"已保存为: {finalOutputPath}", false);
        }
        finally
        {
            try
            {
                if (File.Exists(tempGmlPath))
                {
                    File.Delete(tempGmlPath);
                }
            }
            catch
            {
                // Ignore temp cleanup errors.
            }

            try
            {
                if (Directory.Exists(workingDirectory))
                {
                    Directory.Delete(workingDirectory, recursive: true);
                }
            }
            catch
            {
                // Ignore temp cleanup errors.
            }
        }
    }

    private async Task RunUtmtProcessAsync(string fileName, IReadOnlyList<string> arguments, CancellationToken cancellationToken)
    {
        var psi = new ProcessStartInfo
        {
            FileName = fileName,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            StandardOutputEncoding = System.Text.Encoding.UTF8,
            StandardErrorEncoding = System.Text.Encoding.UTF8,
            CreateNoWindow = true,
            UseShellExecute = false,
            WorkingDirectory = Path.GetDirectoryName(fileName) ?? AppDomain.CurrentDomain.BaseDirectory
        };

        foreach (var argument in arguments)
        {
            psi.ArgumentList.Add(argument);
        }

        using var process = new Process { StartInfo = psi, EnableRaisingEvents = true };
        var tcs = new TaskCompletionSource<int>(TaskCreationOptions.RunContinuationsAsynchronously);
        var stdout = new StringBuilder();
        var stderr = new StringBuilder();

        process.OutputDataReceived += (_, e) =>
        {
            if (!string.IsNullOrWhiteSpace(e.Data))
            {
                stdout.AppendLine(e.Data);
                _log?.Invoke(e.Data, false);
            }
        };

        process.ErrorDataReceived += (_, e) =>
        {
            if (!string.IsNullOrWhiteSpace(e.Data))
            {
                stderr.AppendLine(e.Data);
                _log?.Invoke(e.Data, true);
            }
        };

        process.Exited += (_, _) => tcs.TrySetResult(process.ExitCode);

        if (!process.Start())
        {
            throw new InvalidOperationException("Failed to start UndertaleModCli process.");
        }

        process.BeginOutputReadLine();
        process.BeginErrorReadLine();

        using var registration = cancellationToken.Register(() =>
        {
            try
            {
                if (!process.HasExited)
                {
                    process.Kill(entireProcessTree: true);
                }
            }
            catch
            {
                // Ignore kill errors.
            }
        });

        var exitCode = await tcs.Task.ConfigureAwait(false);
        cancellationToken.ThrowIfCancellationRequested();

        if (exitCode != 0)
        {
            var commandLine = BuildDisplayCommand(arguments);
            var details = BuildFailureDetails(exitCode, commandLine, stdout.ToString(), stderr.ToString());
            throw new InvalidOperationException(details);
        }
    }

    private static string BuildFailureDetails(int exitCode, string commandLine, string stdout, string stderr)
    {
        var builder = new StringBuilder();
        builder.AppendLine($"UTMT command failed with exit code {exitCode}: {commandLine}");

        if (!string.IsNullOrWhiteSpace(stderr))
        {
            builder.AppendLine();
            builder.AppendLine("stderr:");
            builder.AppendLine(stderr.Trim());
        }

        if (!string.IsNullOrWhiteSpace(stdout))
        {
            builder.AppendLine();
            builder.AppendLine("stdout:");
            builder.AppendLine(stdout.Trim());
        }

        return builder.ToString().TrimEnd();
    }

    private static string BuildDisplayCommand(IReadOnlyList<string> arguments)
    {
        return string.Join(" ", arguments.Select(QuoteArgument));
    }

    private static string QuoteArgument(string argument)
    {
        if (argument.Length == 0)
            return "\"\"";

        return argument.Any(char.IsWhiteSpace)
            ? $"\"{argument.Replace("\"", "\\\"")}\""
            : argument;
    }

    private static (int Major, int Minor) ReadVersionFromDataWin(string dataWinPath)
    {
        try
        {
            var version = DataWinVersionReader.Read(dataWinPath);
            return ((int)version.Major, (int)version.Minor);
        }
        catch
        {
            return (0, 0);
        }
    }

    private static string PatchMobileGlobals(
        string template,
        bool addMobileKey,
        bool mobileF2,
        bool mobileHeal,
        bool mobileCn,
        bool androidSystemKeyboard)
    {
        var output = template;

        output = ReplaceGlobalAssignment(output, "add_mobilekey", addMobileKey);
        output = ReplaceGlobalAssignment(output, "mobile_f2", mobileF2);
        output = ReplaceGlobalAssignment(output, "mobile_heal", mobileHeal);
        output = ReplaceGlobalAssignment(output, "mobile_cn", mobileCn);
        output = ReplaceGlobalAssignment(output, "Android_System_Keyboard", androidSystemKeyboard);

        return output;
    }

    private static string ReplaceGlobalAssignment(string content, string globalName, bool enabled)
    {
        var value = enabled ? "1" : "0";
        var pattern = $@"(?im)^\s*global\.{Regex.Escape(globalName)}\s*=\s*\d+\s*;";
        var replacement = $"global.{globalName} = {value};";
        var regex = new Regex(pattern, RegexOptions.Multiline | RegexOptions.IgnoreCase);

        return regex.Replace(content, replacement, 1);
    }

    private static bool DetectUteTemplate(string gameDir)
    {
        if (string.IsNullOrWhiteSpace(gameDir))
            return false;

        var binDir = Path.Combine(gameDir, "bin");
        var localeDir = Path.Combine(gameDir, "locale");
        var gmuConsole = Path.Combine(binDir, "gmu_console.dll");

        return Directory.Exists(binDir)
            && Directory.Exists(localeDir)
            && File.Exists(gmuConsole);
    }

    private static string GetUtmtCliPath()
    {
        return Path.GetFullPath(Path.Combine(
            AppDomain.CurrentDomain.BaseDirectory,
            "..", "..", "..", "..",
            "Tools", "UTMT_CLI_v0.9.1.2-Windows", "UndertaleModCli.exe"));
    }

    private static string GetIntegrationScriptPath()
    {
        return Path.GetFullPath(Path.Combine(
            AppDomain.CurrentDomain.BaseDirectory,
            "..", "..", "..", "..",
            "Tools", "移植脚本", "安卓脚本v2.0", "Mobile集成脚本.csx"));
    }

    private static string GetMobileContTemplatePath()
    {
        return Path.GetFullPath(Path.Combine(
            AppDomain.CurrentDomain.BaseDirectory,
            "..", "..", "..", "..",
            "Tools", "移植脚本", "安卓脚本v2.0", "MobileScript", "mobilecont", "gml_Object_mb_cont_mobile_Create_0.gml"));
    }

    private static string GetUteRepairScriptPath()
    {
        return Path.GetFullPath(Path.Combine(
            AppDomain.CurrentDomain.BaseDirectory,
            "..", "..", "..", "..",
            "Tools", "移植脚本", "Ute 修复脚本", "Ute控制台和路径修复.csx"));
    }

    private static string GetUteRepairScriptPathForOldVersion()
    {
        return Path.GetFullPath(Path.Combine(
            AppDomain.CurrentDomain.BaseDirectory,
            "..", "..", "..", "..",
            "Tools", "移植脚本", "Ute 修复脚本", "低于GMS 2.3.0的脚本", "旧版Ute控制台和路径修复.csx"));
    }

    public static string GetUteRepairScriptPathByVersion(int majorVersion, int minorVersion)
    {
        if (majorVersion < 2 || (majorVersion == 2 && minorVersion < 3))
            return GetUteRepairScriptPathForOldVersion();
        return GetUteRepairScriptPath();
    }
}
