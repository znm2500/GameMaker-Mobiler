using System;
using System.Buffers.Binary;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GameMaker_Mobiler.Services;

public class ApkBuilder
{
    private readonly Action<string, bool>? _log;
    private readonly string _baseDir;

    public ApkBuilder(Action<string, bool>? log = null)
    {
        _log = log;
        _baseDir = AppDomain.CurrentDomain.BaseDirectory;
    }

    private void Log(string message, bool isError = false) => _log?.Invoke(message, isError);

    public string FindTemplateApk(DataWinVersion version)
    {
        var templatesDir = RuntimePaths.TemplatesDirectory;

        if (!Directory.Exists(templatesDir))
            throw new DirectoryNotFoundException($"APK 模板目录不存在: {templatesDir}");

        var allTemplates = Directory.GetFiles(templatesDir, "*.apk")
            .Select(f => new
            {
                Path = f,
                Name = Path.GetFileNameWithoutExtension(f),
                VersionKey = ParseVersionKey(Path.GetFileNameWithoutExtension(f))
            })
            .ToList();

        if (allTemplates.Count == 0)
            throw new InvalidOperationException("未找到任何 APK 模板文件");

        // 1. 精确匹配 (Major + Minor 完全一致)，取 Revision 最高的
        var exactMatch = allTemplates
            .Where(t => t.VersionKey.Major == (int)version.Major && t.VersionKey.Minor == (int)version.Minor)
            .OrderByDescending(t => t.VersionKey.Revision)
            .FirstOrDefault();

        if (exactMatch != null)
        {
            Log($"找到精确匹配模板: {exactMatch.Name}");
            return exactMatch.Path;
        }

        var sameMajor = allTemplates
            .Where(t => t.VersionKey.Major == (int)version.Major)
            .OrderBy(t => t.VersionKey.Minor)
            .ThenBy(t => t.VersionKey.Revision)
            .ToList();

        if (sameMajor.Count > 0)
        {
            // 2. 同 Major，优先选 >= 游戏版本的最低模板（向上兼容：用更高版本 runtime 兼容旧 data）
            var forwardFit = sameMajor
                .FirstOrDefault(t =>
                    t.VersionKey.Minor > (int)version.Minor ||
                    (t.VersionKey.Minor == (int)version.Minor && t.VersionKey.Revision >= (int)version.Release));

            if (forwardFit != null)
            {
                Log($"未找到 v{version.DisplayVersion} 精确模板，使用向上兼容模板: {forwardFit.Name}");
                return forwardFit.Path;
            }

            // 3. 同 Major，所有模板都 < 游戏版本，取最高的模板（向下兼容）
            var backwardFit = sameMajor
                .OrderByDescending(t => t.VersionKey.Minor)
                .ThenByDescending(t => t.VersionKey.Revision)
                .First();
            Log($"未找到 v{version.DisplayVersion} 更高版本模板，使用同系列最高模板: {backwardFit.Name}");
            return backwardFit.Path;
        }

        // 4. 没有同 Major 的模板，使用全局最新模板
        var latest = allTemplates
            .OrderByDescending(t => t.VersionKey.Major)
            .ThenByDescending(t => t.VersionKey.Minor)
            .ThenByDescending(t => t.VersionKey.Revision)
            .First();
        Log($"未找到 v{version.DisplayVersion} 同系列模板，使用全局最新模板: {latest.Name}");
        return latest.Path;
    }

    private static (int Major, int Minor, int Revision) ParseVersionKey(string fileName)
    {
        var parts = fileName.Split('.', StringSplitOptions.RemoveEmptyEntries);
        if (parts.Length >= 3 &&
            int.TryParse(parts[0], out var major) &&
            int.TryParse(parts[1], out var minor) &&
            int.TryParse(parts[2], out var revision))
        {
            return (major, minor, revision);
        }
        if (parts.Length >= 2 &&
            int.TryParse(parts[0], out major) &&
            int.TryParse(parts[1], out minor))
        {
            return (major, minor, 0);
        }
        return (0, 0, 0);
    }

    public async Task BuildApkAsync(
        string templateApkPath,
        string gameDir,
        string dataWinPath,
        string outputPath,
        string appName,
        string packageName,
        string version,
        string? iconPath,
        string? splashPath,
        bool isUteTemplate,
        IProgress<(int Percent, string Message)> progress,
        CancellationToken cancellationToken)
    {
        var safeAppName = SanitizeFileName(appName);

        Log("开始构建 APK...");

        progress.Report((5, "准备工作目录..."));
        using var tempDir = new TempDirectory();

        progress.Report((10, "复制模板 APK..."));
        var unsignedApk = Path.Combine(tempDir.Path, $"{safeAppName}_unsigned.apk");

        progress.Report((20, "使用 Apktool 解包并注入资源..."));
        await BuildWithApktoolAsync(
            templateApkPath,
            gameDir,
            dataWinPath,
            unsignedApk,
            appName,
            packageName,
            version,
            isUteTemplate,
            cancellationToken);

        if (!string.IsNullOrEmpty(iconPath) && File.Exists(iconPath))
        {
            progress.Report((50, "替换应用图标..."));
            ReplaceApkIcon(unsignedApk, iconPath);
        }

        if (!string.IsNullOrEmpty(splashPath) && File.Exists(splashPath))
        {
            progress.Report((55, "替换加载图片..."));
            ReplaceApkSplashScreen(unsignedApk, splashPath);
        }

        progress.Report((60, "APK 对齐优化..."));
        await ZipAlignApkAsync(unsignedApk, cancellationToken);

        progress.Report((70, "签名 APK..."));
        await SignApkAsync(unsignedApk, cancellationToken);

        progress.Report((90, "保存最终 APK..."));
        var outputDir = Path.GetDirectoryName(outputPath);
        if (!string.IsNullOrEmpty(outputDir))
            Directory.CreateDirectory(outputDir);
        File.Copy(unsignedApk, outputPath, overwrite: true);

        progress.Report((100, $"完成！APK 已保存到 {outputPath}"));
        Log($"APK 构建完成: {outputPath}");
    }

    private async Task BuildWithApktoolAsync(
        string templateApkPath,
        string gameDir,
        string dataWinPath,
        string outputApkPath,
        string appName,
        string packageName,
        string version,
        bool isUteTemplate,
        CancellationToken cancellationToken)
    {
        var toolsDir = RuntimePaths.ToolsDirectory;
        var apktoolJar = Path.Combine(toolsDir, "apktool_3.0.3.jar");
        var javaExe = PreparePortableJava(toolsDir);

        if (!File.Exists(apktoolJar))
        {
            throw new FileNotFoundException("未找到 Apktool。", apktoolJar);
        }

        if (!File.Exists(javaExe))
        {
            throw new FileNotFoundException("未找到项目自带 JRE。", javaExe);
        }

        var workingApk = Path.Combine(Path.GetDirectoryName(outputApkPath)!, "apktool-input.apk");
        var decodedDirectory = Path.Combine(Path.GetDirectoryName(outputApkPath)!, "apktool-project");

        CreateApktoolInputApk(templateApkPath, workingApk);

        Log($"Apktool 解包: {Path.GetFileName(workingApk)}");
        await RunJavaToolAsync(
            javaExe,
            apktoolJar,
            new[] { "d", "-f", "-o", decodedDirectory, workingApk },
            cancellationToken);

        var manifestPath = Path.Combine(decodedDirectory, "AndroidManifest.xml");
        var originalPackages = ReadDecodedPackageNames(manifestPath);
        PatchDecodedManifest(manifestPath, originalPackages, packageName, version, appName);
        PatchDecodedPackageNames(decodedDirectory, originalPackages, packageName);

        var assetsDirectory = Path.Combine(decodedDirectory, "assets");
        Directory.CreateDirectory(assetsDirectory);

        File.Copy(
            dataWinPath,
            Path.Combine(assetsDirectory, "game.droid"),
            overwrite: true);

        CopyGameResources(gameDir, assetsDirectory, isUteTemplate);

        if (isUteTemplate)
        {
            StripLocalePrefixes(assetsDirectory);
            RemoveGmuConsoleDll(assetsDirectory);
        }

        Log("Apktool 回编译 APK...");
        await RunJavaToolAsync(
            javaExe,
            apktoolJar,
            new[] { "b", "-f", "--no-crunch", "-o", outputApkPath, decodedDirectory },
            cancellationToken);
        Log("Apktool 构建完成。");
    }

    private static void CreateApktoolInputApk(string sourceApkPath, string destinationApkPath)
    {
        using var input = ZipFile.OpenRead(sourceApkPath);
        using var output = ZipFile.Open(destinationApkPath, ZipArchiveMode.Create);

        foreach (var entry in input.Entries)
        {
            if (string.IsNullOrEmpty(entry.Name))
            {
                output.CreateEntry(entry.FullName);
                continue;
            }

            var compression = string.Equals(entry.FullName, "resources.arsc", StringComparison.OrdinalIgnoreCase)
                ? CompressionLevel.NoCompression
                : CompressionLevel.Optimal;
            var newEntry = output.CreateEntry(entry.FullName, compression);

            using var source = entry.Open();
            using var target = newEntry.Open();
            source.CopyTo(target);
        }
    }

    private static void PatchDecodedManifest(
        string manifestPath,
        IReadOnlyCollection<string> originalPackages,
        string packageName,
        string version,
        string appName)
    {
        var manifest = File.ReadAllText(manifestPath, Encoding.UTF8);
        foreach (var originalPackage in originalPackages.OrderByDescending(value => value.Length))
        {
            manifest = manifest.Replace(originalPackage, packageName, StringComparison.Ordinal);
            manifest = manifest.Replace(
                originalPackage.Replace('.', '/'),
                packageName.Replace('.', '/'),
                StringComparison.Ordinal);
        }
        manifest = Regex.Replace(
            manifest,
            "(\\bpackage\\s*=\\s*[\"'])[^\"']*([\"'])",
            $"$1{MatchEvaluatorEscapeReplacement(packageName)}$2",
            RegexOptions.CultureInvariant);
        manifest = Regex.Replace(
            manifest,
            "(android:versionName\\s*=\\s*[\"'])[^\"']*([\"'])",
            $"$1{MatchEvaluatorEscapeReplacement(version)}$2",
            RegexOptions.CultureInvariant);
        File.WriteAllText(manifestPath, manifest, new UTF8Encoding(encoderShouldEmitUTF8Identifier: false));

        var stringsPath = Directory
            .EnumerateFiles(Path.Combine(Path.GetDirectoryName(manifestPath)!, "res"), "strings.xml", SearchOption.AllDirectories)
            .FirstOrDefault();
        if (stringsPath == null)
        {
            return;
        }

        var stringsDocument = XDocument.Load(stringsPath, LoadOptions.PreserveWhitespace);
        var appNameElement = stringsDocument
            .Descendants("string")
            .FirstOrDefault(element =>
                string.Equals(
                    (string?)element.Attribute("name"),
                    "app_name",
                    StringComparison.Ordinal));

        if (appNameElement != null)
        {
            appNameElement.Value = appName;
            stringsDocument.Save(
                stringsPath,
                SaveOptions.DisableFormatting);
        }
    }

    private static string MatchEvaluatorEscapeReplacement(string value)
    {
        return value.Replace("$", "$$", StringComparison.Ordinal);
    }

    private static void PatchDecodedPackageNames(
        string decodedDirectory,
        IReadOnlyCollection<string> originalPackages,
        string packageName)
    {
        foreach (var smaliDirectory in Directory.GetDirectories(decodedDirectory, "smali*", SearchOption.TopDirectoryOnly))
        {
            foreach (var file in Directory.EnumerateFiles(smaliDirectory, "*.smali", SearchOption.AllDirectories))
            {
                var text = File.ReadAllText(file, Encoding.UTF8);
                var patched = ReplacePackageReferences(text, originalPackages, packageName);
                if (!string.Equals(text, patched, StringComparison.Ordinal))
                {
                    File.WriteAllText(file, patched, new UTF8Encoding(encoderShouldEmitUTF8Identifier: false));
                }
            }
        }

        foreach (var originalPackage in originalPackages.OrderByDescending(value => value.Length))
        {
            var originalSlash = originalPackage.Replace('.', '/');
            var packageDirectory = originalSlash
                .Split('/', StringSplitOptions.RemoveEmptyEntries)
                .Aggregate(decodedDirectory, Path.Combine);
            var renamedPackageDirectory = packageName
                .Replace('.', '/')
                .Split('/', StringSplitOptions.RemoveEmptyEntries)
                .Aggregate(decodedDirectory, Path.Combine);

            if (Directory.Exists(packageDirectory) &&
                !string.Equals(packageDirectory, renamedPackageDirectory, StringComparison.OrdinalIgnoreCase))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(renamedPackageDirectory)!);
                if (Directory.Exists(renamedPackageDirectory))
                {
                    CopyDirectoryVerbatim(packageDirectory, renamedPackageDirectory);
                    Directory.Delete(packageDirectory, recursive: true);
                }
                else
                {
                    Directory.Move(packageDirectory, renamedPackageDirectory);
                }
            }
        }

        foreach (var xmlFile in Directory.EnumerateFiles(decodedDirectory, "*.xml", SearchOption.AllDirectories))
        {
            var text = File.ReadAllText(xmlFile, Encoding.UTF8);
            var patched = ReplacePackageReferences(text, originalPackages, packageName);
            if (!string.Equals(text, patched, StringComparison.Ordinal))
            {
                File.WriteAllText(xmlFile, patched, new UTF8Encoding(encoderShouldEmitUTF8Identifier: false));
            }
        }
    }

    private static string ReplacePackageReferences(
        string text,
        IReadOnlyCollection<string> originalPackages,
        string packageName)
    {
        foreach (var originalPackage in originalPackages.OrderByDescending(value => value.Length))
        {
            text = text.Replace(originalPackage, packageName, StringComparison.Ordinal);
            text = text.Replace(
                originalPackage.Replace('.', '/'),
                packageName.Replace('.', '/'),
                StringComparison.Ordinal);
        }

        return text;
    }

    private static IReadOnlyCollection<string> ReadDecodedPackageNames(string manifestPath)
    {
        var manifest = File.ReadAllText(manifestPath, Encoding.UTF8);
        var packages = new HashSet<string>(StringComparer.Ordinal);

        var packageMatch = Regex.Match(
            manifest,
            "\\bpackage\\s*=\\s*[\"']([^\"']+)[\"']",
            RegexOptions.CultureInvariant);
        if (packageMatch.Success)
        {
            packages.Add(packageMatch.Groups[1].Value);
        }

        foreach (Match match in Regex.Matches(
                     manifest,
                     "<(?:application|activity)\\b[^>]*?android:name\\s*=\\s*[\"']([^\"']+)[\"']",
                     RegexOptions.CultureInvariant | RegexOptions.Singleline))
        {
            var className = match.Groups[1].Value;
            if (className.StartsWith(".", StringComparison.Ordinal) ||
                !className.Contains('.', StringComparison.Ordinal) ||
                className.StartsWith("android.", StringComparison.Ordinal) ||
                className.StartsWith("androidx.", StringComparison.Ordinal))
            {
                continue;
            }

            var lastDot = className.LastIndexOf('.');
            if (lastDot > 0 && className.IndexOf('.') > 0)
            {
                packages.Add(className[..lastDot]);
            }
        }

        if (packages.Count == 0)
        {
            throw new InvalidDataException("无法从模板 AndroidManifest.xml 读取原包名。");
        }

        return packages;
    }

    private async Task RunJavaToolAsync(
        string javaExe,
        string jarPath,
        IEnumerable<string> arguments,
        CancellationToken cancellationToken)
    {
        var psi = new ProcessStartInfo
        {
            FileName = javaExe,
            UseShellExecute = false,
            CreateNoWindow = true,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            StandardOutputEncoding = Encoding.UTF8,
            StandardErrorEncoding = Encoding.UTF8
        };
        psi.ArgumentList.Add("-jar");
        psi.ArgumentList.Add(jarPath);
        foreach (var argument in arguments)
        {
            psi.ArgumentList.Add(argument);
        }

        var commandLine = BuildDisplayCommand(javaExe, jarPath, arguments);
        Log($"启动外部工具: {commandLine}");

        using var process = new Process { StartInfo = psi, EnableRaisingEvents = true };
        var exitTcs = new TaskCompletionSource<int>(TaskCreationOptions.RunContinuationsAsynchronously);
        var stdoutClosedTcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
        var stderrClosedTcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
        var stdout = new StringBuilder();
        var stderr = new StringBuilder();

        process.OutputDataReceived += (_, e) =>
        {
            if (e.Data is null)
            {
                stdoutClosedTcs.TrySetResult();
                return;
            }

            if (e.Data.Length == 0)
            {
                return;
            }

            stdout.AppendLine(e.Data);
            Log(e.Data);
        };
        process.ErrorDataReceived += (_, e) =>
        {
            if (e.Data is null)
            {
                stderrClosedTcs.TrySetResult();
                return;
            }

            if (e.Data.Length == 0)
            {
                return;
            }

            stderr.AppendLine(e.Data);
            Log(e.Data, true);
        };
        process.Exited += (_, _) => exitTcs.TrySetResult(process.ExitCode);

        if (!process.Start())
        {
            throw new InvalidOperationException($"无法启动 Java 工具: {jarPath}");
        }

        process.BeginOutputReadLine();
        process.BeginErrorReadLine();

        using var registration = cancellationToken.Register(() =>
        {
            try
            {
                if (!process.HasExited)
                {
                    Log("收到取消请求，正在终止外部工具...", true);
                    process.Kill(entireProcessTree: true);
                }
            }
            catch (Exception ex)
            {
                Log($"终止外部工具失败: {ex.Message}", true);
            }
        });

        try
        {
            await Task.WhenAll(
                exitTcs.Task,
                stdoutClosedTcs.Task,
                stderrClosedTcs.Task).WaitAsync(cancellationToken);
        }
        catch (OperationCanceledException)
        {
            throw;
        }

        var exitCode = await exitTcs.Task;
        if (exitCode != 0)
        {
            throw new InvalidOperationException(
                $"Java 工具执行失败 ({exitCode}): {commandLine}\n{stdout}\n{stderr}");
        }

        Log($"外部工具完成，退出码: {exitCode}");
    }

    private static string BuildDisplayCommand(
        string javaExe,
        string jarPath,
        IEnumerable<string> arguments)
    {
        static string Quote(string value) =>
            value.Contains(' ', StringComparison.Ordinal) ||
            value.Contains('\t', StringComparison.Ordinal)
                ? $"\"{value.Replace("\"", "\\\"", StringComparison.Ordinal)}\""
                : value;

        return string.Join(
            " ",
            new[] { Quote(javaExe), "-jar", Quote(jarPath) }
                .Concat(arguments.Select(Quote)));
    }

    private Task InjectGameResourcesAsync(
        string apkPath,
        string gameDir,
        string dataWinPath,
        bool isUteTemplate,
        CancellationToken cancellationToken)
    {
        var tempExtractDir = Path.Combine(Path.GetTempPath(), $"gm_mobiler_{Guid.NewGuid():N}");
        try
        {
            Directory.CreateDirectory(tempExtractDir);
            ExtractArchiveAllowingDuplicateEntries(apkPath, tempExtractDir);

            var assetsDir = Path.Combine(tempExtractDir, "assets");
            if (!Directory.Exists(assetsDir))
                throw new InvalidOperationException("APK 模板中未找到 assets 目录");

            var gameDroidPath = Path.Combine(gameDir, "game.droid");
            if (File.Exists(gameDroidPath))
            {
                var gameDroidTarget = Path.Combine(assetsDir, "game.droid");
                File.Copy(gameDroidPath, gameDroidTarget, overwrite: true);
                Log("game.droid 已注入 APK");
            }
            else
            {
                var dataWinTarget = Path.Combine(assetsDir, "game.droid");
                File.Copy(dataWinPath, dataWinTarget, overwrite: true);
                Log("data.win 已改名为 game.droid 并注入 APK");
            }

            CopyGameResources(gameDir, assetsDir, isUteTemplate);

            if (isUteTemplate)
            {
                StripLocalePrefixes(assetsDir);
                RemoveGmuConsoleDll(assetsDir);
            }

            if (cancellationToken.IsCancellationRequested)
                throw new OperationCanceledException();

            File.Delete(apkPath);
            CreateApkArchive(tempExtractDir, apkPath);
            Log("资源注入完成，APK 已重新打包");
        }
        finally
        {
            try { if (Directory.Exists(tempExtractDir)) Directory.Delete(tempExtractDir, recursive: true); } catch { }
        }

        return Task.CompletedTask;
    }

    private void ExtractArchiveAllowingDuplicateEntries(string apkPath, string destinationDirectory)
    {
        using var archive = ZipFile.OpenRead(apkPath);
        var duplicateCount = 0;

        foreach (var entry in archive.Entries)
        {
            var destinationPath = Path.GetFullPath(Path.Combine(destinationDirectory, entry.FullName));
            var destinationRoot = Path.GetFullPath(destinationDirectory + Path.DirectorySeparatorChar);

            if (!destinationPath.StartsWith(destinationRoot, StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException($"APK 模板包含非法路径: {entry.FullName}");
            }

            if (string.IsNullOrEmpty(entry.Name))
            {
                Directory.CreateDirectory(destinationPath);
                continue;
            }

            Directory.CreateDirectory(Path.GetDirectoryName(destinationPath)!);

            if (File.Exists(destinationPath))
            {
                duplicateCount++;
            }

            entry.ExtractToFile(destinationPath, overwrite: true);
        }

        if (duplicateCount > 0)
        {
            Log($"APK 模板包含 {duplicateCount} 个重复资源条目，已使用后出现的条目覆盖。");
        }
    }

    private void CopyGameResources(string gameDir, string assetsDir, bool isUteTemplate)
    {
        var skipFiles = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            "data.win",
            "game.droid"
        };

        foreach (var file in Directory.GetFiles(gameDir))
        {
            var fileName = Path.GetFileName(file);
            if (skipFiles.Contains(fileName) || IsExcludedGameResource(file)) continue;

            var targetPath = Path.Combine(assetsDir, fileName);
            File.Copy(file, targetPath, overwrite: true);
            Log($"注入: {fileName}");
        }

        var dirsToCopy = new[] { "locale", "bin", "data", "assets" };
        foreach (var dirName in dirsToCopy)
        {
            var sourceDir = Path.Combine(gameDir, dirName);
            if (!Directory.Exists(sourceDir)) continue;

            var targetDir = Path.Combine(assetsDir, dirName);
            if (Directory.Exists(targetDir))
                Directory.Delete(targetDir, recursive: true);

            CopyDirectory(sourceDir, targetDir);
            Log($"注入目录: {dirName}/");
        }
    }

    private static void CreateApkArchive(string sourceDirectory, string apkPath)
    {
        using var output = ZipFile.Open(apkPath, ZipArchiveMode.Create);

        foreach (var filePath in Directory.EnumerateFiles(sourceDirectory, "*", SearchOption.AllDirectories))
        {
            var relativePath = Path.GetRelativePath(sourceDirectory, filePath)
                .Replace(Path.DirectorySeparatorChar, '/');
            var entry = output.CreateEntry(relativePath, GetApkCompressionLevel(relativePath));

            using var input = File.OpenRead(filePath);
            using var destination = entry.Open();
            input.CopyTo(destination);
        }
    }

    private static CompressionLevel GetApkCompressionLevel(string entryName)
    {
        return string.Equals(entryName, "resources.arsc", StringComparison.OrdinalIgnoreCase)
            ? CompressionLevel.NoCompression
            : CompressionLevel.Optimal;
    }

    private static void CopyDirectory(string sourceDir, string targetDir)
    {
        Directory.CreateDirectory(targetDir);
        foreach (var file in Directory.GetFiles(sourceDir))
        {
            if (IsExcludedGameResource(file)) continue;

            var targetFile = Path.Combine(targetDir, Path.GetFileName(file));
            File.Copy(file, targetFile, overwrite: true);
        }
        foreach (var dir in Directory.GetDirectories(sourceDir))
        {
            var targetSubDir = Path.Combine(targetDir, Path.GetFileName(dir));
            CopyDirectory(dir, targetSubDir);
        }
    }

    private static void CopyDirectoryVerbatim(string sourceDir, string targetDir)
    {
        Directory.CreateDirectory(targetDir);

        foreach (var file in Directory.GetFiles(sourceDir))
        {
            var targetFile = Path.Combine(targetDir, Path.GetFileName(file));
            File.Copy(file, targetFile, overwrite: true);
        }

        foreach (var dir in Directory.GetDirectories(sourceDir))
        {
            var targetSubDir = Path.Combine(targetDir, Path.GetFileName(dir));
            CopyDirectoryVerbatim(dir, targetSubDir);
        }
    }

    private static bool IsExcludedGameResource(string filePath)
    {
        return string.Equals(Path.GetExtension(filePath), ".exe", StringComparison.OrdinalIgnoreCase);
    }

    private void StripLocalePrefixes(string assetsDir)
    {
        var localeDir = Path.Combine(assetsDir, "locale");
        if (!Directory.Exists(localeDir))
        {
            Log("locale 目录不存在，跳过前缀清理");
            return;
        }

        var targets = new[] { "font.txt", "sprite.txt", "string.txt" };
        int changedFiles = 0;

        foreach (var langDir in Directory.GetDirectories(localeDir).OrderBy(d => d))
        {
            foreach (var target in targets)
            {
                var filePath = Path.Combine(langDir, target);
                if (!File.Exists(filePath)) continue;

                var lines = File.ReadAllLines(filePath, Encoding.UTF8);
                bool modified = false;
                var newLines = new List<string>(lines.Length);

                foreach (var line in lines)
                {
                    if (line.StartsWith("./", StringComparison.Ordinal))
                    {
                        newLines.Add(line[2..]);
                        modified = true;
                    }
                    else
                    {
                        newLines.Add(line);
                    }
                }

                if (modified)
                {
                    File.WriteAllLines(filePath, newLines, Encoding.UTF8);
                    changedFiles++;
                }
            }
        }

        Log($"locale 前缀清理完成，共修改 {changedFiles} 个文件");
    }

    private void RemoveGmuConsoleDll(string assetsDir)
    {
        var gmuPath = Path.Combine(assetsDir, "bin", "gmu_console.dll");
        if (File.Exists(gmuPath))
        {
            File.Delete(gmuPath);
            Log("已移除 gmu_console.dll（UTE 模板处理）");
        }
    }

    private void PatchApkManifest(string apkPath, string packageName, string version, string appName)
    {
        var entriesToRemove = new HashSet<string>(StringComparer.Ordinal)
        {
            "META-INF/",
            "META-INF/MANIFEST.MF",
            "META-INF/CERT.RSA",
            "META-INF/CERT.SF",
            "META-INF/CERT.DSA",
            "META-INF/CERT.EC"
        };

        var tempFile = apkPath + ".tmp";

        using (var zip = ZipFile.OpenRead(apkPath))
        using (var output = ZipFile.Open(tempFile, ZipArchiveMode.Create))
        {
            var manifestEntry = zip.GetEntry("AndroidManifest.xml")
                ?? throw new InvalidDataException("APK 中未找到 AndroidManifest.xml。");
            using var manifestStream = manifestEntry.Open();
            using var manifestBuffer = new MemoryStream();
            manifestStream.CopyTo(manifestBuffer);
            var originalPackageName = ReadAndroidManifestPackageName(manifestBuffer.ToArray());

            if (string.IsNullOrWhiteSpace(originalPackageName))
            {
                throw new InvalidDataException("无法从 AndroidManifest.xml 读取模板包名。");
            }

            var effectivePackageName = packageName;

            foreach (var entry in zip.Entries)
            {
                if (entriesToRemove.Any(e => entry.FullName.StartsWith(e, StringComparison.Ordinal)))
                    continue;

                if (entry.FullName == "AndroidManifest.xml")
                {
                    using var stream = entry.Open();
                    using var ms = new MemoryStream();
                    stream.CopyTo(ms);
                    var manifestData = ms.ToArray();

                    manifestData = PatchAndroidManifest(manifestData, effectivePackageName, version, appName);

                    var newEntry = output.CreateEntry(entry.FullName, GetApkCompressionLevel(entry.FullName));
                    using var newStream = newEntry.Open();
                    newStream.Write(manifestData, 0, manifestData.Length);
                }
                else if (string.Equals(entry.FullName, "resources.arsc", StringComparison.OrdinalIgnoreCase) &&
                         !string.Equals(originalPackageName, effectivePackageName, StringComparison.Ordinal))
                {
                    using var stream = entry.Open();
                    using var ms = new MemoryStream();
                    stream.CopyTo(ms);

                    var resourcesData = PatchResourceTablePackageName(
                        ms.ToArray(),
                        originalPackageName,
                        effectivePackageName);

                    var newEntry = output.CreateEntry(entry.FullName, GetApkCompressionLevel(entry.FullName));
                    using var newStream = newEntry.Open();
                    newStream.Write(resourcesData, 0, resourcesData.Length);
                }
                else if (IsDexEntry(entry.FullName) &&
                         !string.Equals(originalPackageName, effectivePackageName, StringComparison.Ordinal))
                {
                    using var stream = entry.Open();
                    using var ms = new MemoryStream();
                    stream.CopyTo(ms);

                    var dexData = PatchDexPackageNames(
                        ms.ToArray(),
                        originalPackageName,
                        effectivePackageName);

                    var newEntry = output.CreateEntry(entry.FullName, GetApkCompressionLevel(entry.FullName));
                    using var newStream = newEntry.Open();
                    newStream.Write(dexData, 0, dexData.Length);
                }
                else
                {
                    var newEntry = output.CreateEntry(entry.FullName, GetApkCompressionLevel(entry.FullName));
                    using var stream = entry.Open();
                    using var newStream = newEntry.Open();
                    stream.CopyTo(newStream);
                }
            }

            Log($"Manifest 已更新: 包名={effectivePackageName}, 版本={version}, 名称={appName}");
        }

        File.Delete(apkPath);
        File.Move(tempFile, apkPath);
    }

    private static bool IsDexEntry(string entryName)
    {
        var fileName = Path.GetFileName(entryName);
        return fileName.StartsWith("classes", StringComparison.OrdinalIgnoreCase) &&
               fileName.EndsWith(".dex", StringComparison.OrdinalIgnoreCase);
    }

    private static byte[] PatchResourceTablePackageName(
        byte[] resourcesData,
        string originalPackageName,
        string packageName)
    {
        const ushort ResourceTableType = 0x0002;
        const ushort PackageType = 0x0200;
        const int ResourceTableHeaderSize = 12;
        const int PackageHeaderSize = 288;
        const int PackageNameOffset = 12;
        const int PackageNameCharCount = 128;

        if (resourcesData.Length < ResourceTableHeaderSize ||
            ReadUInt16(resourcesData, 0) != ResourceTableType)
        {
            throw new InvalidDataException("resources.arsc 的资源表头无效。");
        }

        if (packageName.Length >= PackageNameCharCount)
        {
            throw new InvalidDataException("包名过长，无法写入 resources.arsc。");
        }

        var result = (byte[])resourcesData.Clone();
        var chunkOffset = ResourceTableHeaderSize;

        if (chunkOffset + 8 > result.Length)
        {
            throw new InvalidDataException("resources.arsc 的资源表内容无效。");
        }

        var globalStringPoolSize = checked((int)ReadUInt32(result, chunkOffset + 4));
        chunkOffset += globalStringPoolSize;

        var patched = false;
        while (chunkOffset + 8 <= result.Length)
        {
            var chunkSize = checked((int)ReadUInt32(result, chunkOffset + 4));
            if (chunkSize < 8 || chunkSize > result.Length - chunkOffset)
            {
                throw new InvalidDataException("resources.arsc 中存在无效的 chunk。");
            }

            if (ReadUInt16(result, chunkOffset) == PackageType &&
                chunkSize >= PackageHeaderSize)
            {
                var originalName = Encoding.Unicode.GetString(
                    result,
                    chunkOffset + PackageNameOffset,
                    PackageNameCharCount * 2)
                    .TrimEnd('\0');

                if (string.Equals(originalName, originalPackageName, StringComparison.Ordinal))
                {
                    Array.Clear(
                        result,
                        chunkOffset + PackageNameOffset,
                        PackageNameCharCount * 2);
                    Encoding.Unicode.GetBytes(packageName)
                        .CopyTo(result, chunkOffset + PackageNameOffset);
                    patched = true;
                }
            }

            chunkOffset += chunkSize;
        }

        if (!patched)
        {
            return resourcesData;
        }

        return result;
    }

    private static string? ReadAndroidManifestPackageName(byte[] manifestData)
    {
        const ushort XmlChunkType = 0x0003;
        const ushort StringPoolChunkType = 0x0001;
        const ushort StartElementChunkType = 0x0102;

        if (manifestData.Length < 8 ||
            ReadUInt16(manifestData, 0) != XmlChunkType)
        {
            return null;
        }

        var rootHeaderSize = ReadUInt16(manifestData, 2);
        if (rootHeaderSize < 8 || rootHeaderSize > manifestData.Length - 8)
        {
            return null;
        }

        var stringPoolOffset = rootHeaderSize;
        if (stringPoolOffset + 8 > manifestData.Length ||
            ReadUInt16(manifestData, stringPoolOffset) != StringPoolChunkType)
        {
            return null;
        }

        var stringPool = AndroidStringPool.Parse(manifestData, stringPoolOffset);
        var stringPoolEnd = stringPoolOffset + stringPool.ChunkSize;

        for (var chunkOffset = stringPoolEnd; chunkOffset + 8 <= manifestData.Length;)
        {
            var chunkType = ReadUInt16(manifestData, chunkOffset);
            var chunkHeaderSize = ReadUInt16(manifestData, chunkOffset + 2);
            var chunkSize = ReadUInt32(manifestData, chunkOffset + 4);

            if (chunkSize < chunkHeaderSize ||
                chunkSize > manifestData.Length - chunkOffset)
            {
                return null;
            }

            if (chunkType == StartElementChunkType && chunkHeaderSize >= 16)
            {
                var extensionOffset = chunkOffset + 16;
                if (extensionOffset + 20 <= manifestData.Length)
                {
                    var elementNameIndex = ReadUInt32(manifestData, extensionOffset + 4);
                    if (!string.Equals(stringPool.GetString(elementNameIndex), "manifest", StringComparison.Ordinal))
                    {
                        chunkOffset += checked((int)chunkSize);
                        continue;
                    }

                    var attributeStart = ReadUInt16(manifestData, extensionOffset + 8);
                    var attributeSize = ReadUInt16(manifestData, extensionOffset + 10);
                    var attributeCount = ReadUInt16(manifestData, extensionOffset + 12);
                    var attributesOffset = extensionOffset + attributeStart;

                    if (attributeSize < 20 ||
                        attributesOffset < chunkOffset ||
                        attributesOffset > chunkOffset + chunkSize)
                    {
                        return null;
                    }

                    for (var index = 0; index < attributeCount; index++)
                    {
                        var attributeOffset = attributesOffset + index * attributeSize;
                        if (attributeOffset < attributesOffset ||
                            attributeOffset + 20 > chunkOffset + chunkSize)
                        {
                            return null;
                        }

                        var nameIndex = ReadUInt32(manifestData, attributeOffset + 4);
                        if (!string.Equals(stringPool.GetString(nameIndex), "package", StringComparison.Ordinal))
                        {
                            continue;
                        }

                        var rawValueIndex = ReadUInt32(manifestData, attributeOffset + 8);
                        var valueType = manifestData[attributeOffset + 15];
                        var typedValueIndex = ReadUInt32(manifestData, attributeOffset + 16);
                        return stringPool.GetString(
                            rawValueIndex != uint.MaxValue && rawValueIndex < stringPool.Count
                                ? rawValueIndex
                                : valueType == 0x03
                                    ? typedValueIndex
                                    : uint.MaxValue);
                    }

                    return null;
                }
            }

            chunkOffset += checked((int)chunkSize);
        }

        return null;
    }

    private static byte[] PatchDexPackageNames(
        byte[] dexData,
        string originalPackageName,
        string packageName)
    {
        const int DexHeaderSize = 0x70;
        const int DexFileSizeOffset = 0x20;
        const int DexMapOffset = 0x34;
        const int DexStringIdsSizeOffset = 0x38;
        const int DexStringIdsOffsetOffset = 0x3C;
        const int DexDataSizeOffset = 0x68;
        const ushort DexMapTypeStringDataItem = 0x2002;

        if (dexData.Length < DexHeaderSize ||
            dexData[0] != (byte)'d' ||
            dexData[1] != (byte)'e' ||
            dexData[2] != (byte)'x' ||
            dexData[3] != (byte)'\n')
        {
            return dexData;
        }

        var stringIdsSize = checked((int)ReadUInt32(dexData, DexStringIdsSizeOffset));
        var stringIdsOffset = checked((int)ReadUInt32(dexData, DexStringIdsOffsetOffset));
        if (stringIdsSize < 0 ||
            stringIdsOffset < DexHeaderSize ||
            stringIdsOffset > dexData.Length ||
            stringIdsSize > (dexData.Length - stringIdsOffset) / 4)
        {
            throw new InvalidDataException("DEX 字符串表无效。");
        }

        var oldPackageBytes = Encoding.ASCII.GetBytes(originalPackageName);
        var newPackageBytes = Encoding.ASCII.GetBytes(packageName);
        var oldDescriptorBytes = Encoding.ASCII.GetBytes(originalPackageName.Replace('.', '/'));
        var newDescriptorBytes = Encoding.ASCII.GetBytes(packageName.Replace('.', '/'));

        var stringItems = new List<DexStringItem>(stringIdsSize);
        var changed = false;

        for (var index = 0; index < stringIdsSize; index++)
        {
            var stringIdOffset = checked(stringIdsOffset + index * 4);
            var originalStringOffset = checked((int)ReadUInt32(dexData, stringIdOffset));
            if (originalStringOffset < DexHeaderSize || originalStringOffset >= dexData.Length)
            {
                throw new InvalidDataException("DEX 字符串项偏移无效。");
            }

            var cursor = originalStringOffset;
            var utf16Length = ReadUleb128(dexData, ref cursor);
            var stringDataStart = cursor;
            while (cursor < dexData.Length && dexData[cursor] != 0)
            {
                cursor++;
            }

            if (cursor >= dexData.Length)
            {
                throw new InvalidDataException("DEX 字符串项未找到结束标记。");
            }

            var originalStringData = dexData[stringDataStart..cursor];
            var rebuiltStringData = ReplaceAsciiPackageBytes(
                originalStringData,
                oldPackageBytes,
                newPackageBytes);
            rebuiltStringData = ReplaceAsciiPackageBytes(
                rebuiltStringData,
                oldDescriptorBytes,
                newDescriptorBytes);

            if (!originalStringData.AsSpan().SequenceEqual(rebuiltStringData))
            {
                changed = true;
                var stringLengthDelta = rebuiltStringData.Length - originalStringData.Length;
                utf16Length = checked((uint)((int)utf16Length + stringLengthDelta));
            }

            stringItems.Add(new DexStringItem(
                index,
                Encoding.UTF8.GetString(rebuiltStringData),
                utf16Length,
                rebuiltStringData));
        }

        if (!changed)
        {
            return dexData;
        }

        var originalMapOffset = checked((int)ReadUInt32(dexData, DexMapOffset));
        if (originalMapOffset < DexHeaderSize ||
            originalMapOffset > dexData.Length - 4)
        {
            throw new InvalidDataException("DEX map_list 偏移无效。");
        }

        var orderedStringItems = stringItems
            .OrderBy(item => item.Value, StringComparer.Ordinal)
            .ToList();
        var stringIndexRemap = new uint[stringIdsSize];
        using var rebuiltStrings = new MemoryStream();
        var rebuiltOffsets = new uint[stringIdsSize];

        for (var index = 0; index < orderedStringItems.Count; index++)
        {
            var item = orderedStringItems[index];
            stringIndexRemap[item.OriginalIndex] = checked((uint)index);
            rebuiltOffsets[index] = checked((uint)rebuiltStrings.Position);
            WriteUleb128(rebuiltStrings, item.Utf16Length);
            rebuiltStrings.Write(item.Data);
            rebuiltStrings.WriteByte(0);
        }

        var rebuiltStringBytes = rebuiltStrings.ToArray();
        var insertedStringData = rebuiltStringBytes;
        var mapSize = ReadUInt32(dexData, originalMapOffset);
        var stringDataOffset = -1;
        var stringDataEnd = dexData.Length;

        for (var index = 0; index < mapSize; index++)
        {
            var mapEntryOffset = checked(originalMapOffset + 4 + (int)index * 12);
            var mapType = ReadUInt16(dexData, mapEntryOffset);
            var itemOffset = checked((int)ReadUInt32(dexData, mapEntryOffset + 8));

            if (mapType == DexMapTypeStringDataItem)
            {
                stringDataOffset = itemOffset;
            }
            else if (stringDataOffset >= 0 && itemOffset > stringDataOffset)
            {
                stringDataEnd = Math.Min(stringDataEnd, itemOffset);
            }
        }

        if (stringDataOffset < DexHeaderSize ||
            stringDataOffset >= originalMapOffset ||
            stringDataEnd <= stringDataOffset)
        {
            throw new InvalidDataException("DEX 字符串数据区无效。");
        }

        var originalStringDataLength = stringDataEnd - stringDataOffset;
        var lengthDelta = insertedStringData.Length - originalStringDataLength;
        const int mapPaddingLength = 4;
        var mapSourceOffset = checked(originalMapOffset - mapPaddingLength);
        var totalLengthDelta = checked(lengthDelta - mapPaddingLength);
        var shiftedMapOffset = checked(originalMapOffset + totalLengthDelta);
        var result = new byte[checked(dexData.Length + totalLengthDelta)];
        Buffer.BlockCopy(dexData, 0, result, 0, stringDataOffset);
        Buffer.BlockCopy(insertedStringData, 0, result, stringDataOffset, insertedStringData.Length);
        Buffer.BlockCopy(
            dexData,
            stringDataEnd,
            result,
            stringDataOffset + insertedStringData.Length,
            mapSourceOffset - stringDataEnd);
        Buffer.BlockCopy(
            dexData,
            originalMapOffset,
            result,
            shiftedMapOffset,
            dexData.Length - originalMapOffset);

        for (var index = 0; index < rebuiltOffsets.Length; index++)
        {
            WriteUInt32(
                result,
                checked(stringIdsOffset + index * 4),
                checked((uint)(stringDataOffset + rebuiltOffsets[index])));
        }

        RemapDexStringReferences(result, stringIndexRemap);

        WriteUInt32(result, DexMapOffset, checked((uint)shiftedMapOffset));
        WriteUInt32(result, DexFileSizeOffset, checked((uint)result.Length));

        var originalDataSize = ReadUInt32(dexData, DexDataSizeOffset);
        WriteUInt32(
            result,
            DexDataSizeOffset,
            checked((uint)((int)originalDataSize + totalLengthDelta)));

        for (var index = 0; index < mapSize; index++)
        {
            var mapEntryOffset = checked(shiftedMapOffset + 4 + (int)index * 12);
            var mapType = ReadUInt16(result, mapEntryOffset);
            var itemOffset = ReadUInt32(result, mapEntryOffset + 8);

            if (mapType == DexMapTypeStringDataItem)
            {
                WriteUInt32(result, mapEntryOffset + 8, checked((uint)stringDataOffset));
                WriteUInt32(result, mapEntryOffset + 4, checked((uint)stringIdsSize));
            }
            else if (mapType == 0x1000)
            {
                WriteUInt32(result, mapEntryOffset + 8, checked((uint)shiftedMapOffset));
            }
            else if (itemOffset >= (uint)stringDataEnd)
            {
                WriteUInt32(
                    result,
                    mapEntryOffset + 8,
                    checked((uint)((int)itemOffset + lengthDelta)));
            }
        }

        RecalculateDexChecksums(result);
        return result;
    }

    private sealed record DexStringItem(
        int OriginalIndex,
        string Value,
        uint Utf16Length,
        byte[] Data);

    private static void RemapDexStringReferences(byte[] dexData, uint[] remap)
    {
        var typeIdsSize = checked((int)ReadUInt32(dexData, 0x40));
        var typeIdsOffset = checked((int)ReadUInt32(dexData, 0x44));
        for (var index = 0; index < typeIdsSize; index++)
        {
            var offset = checked(typeIdsOffset + index * 4);
            WriteUInt32(dexData, offset, RemapStringIndex(ReadUInt32(dexData, offset), remap));
        }

        var protoIdsSize = checked((int)ReadUInt32(dexData, 0x48));
        var protoIdsOffset = checked((int)ReadUInt32(dexData, 0x4C));
        for (var index = 0; index < protoIdsSize; index++)
        {
            var offset = checked(protoIdsOffset + index * 12);
            WriteUInt32(dexData, offset, RemapStringIndex(ReadUInt32(dexData, offset), remap));
        }

        var fieldIdsSize = checked((int)ReadUInt32(dexData, 0x50));
        var fieldIdsOffset = checked((int)ReadUInt32(dexData, 0x54));
        for (var index = 0; index < fieldIdsSize; index++)
        {
            var offset = checked(fieldIdsOffset + index * 8 + 4);
            WriteUInt32(dexData, offset, RemapStringIndex(ReadUInt32(dexData, offset), remap));
        }

        var methodIdsSize = checked((int)ReadUInt32(dexData, 0x58));
        var methodIdsOffset = checked((int)ReadUInt32(dexData, 0x5C));
        for (var index = 0; index < methodIdsSize; index++)
        {
            var offset = checked(methodIdsOffset + index * 8 + 4);
            WriteUInt32(dexData, offset, RemapStringIndex(ReadUInt32(dexData, offset), remap));
        }

        var classDefsSize = checked((int)ReadUInt32(dexData, 0x60));
        var classDefsOffset = checked((int)ReadUInt32(dexData, 0x64));
        for (var index = 0; index < classDefsSize; index++)
        {
            var offset = checked(classDefsOffset + index * 32 + 16);
            WriteUInt32(dexData, offset, RemapStringIndex(ReadUInt32(dexData, offset), remap));
        }
    }

    private static uint RemapStringIndex(uint index, uint[] remap)
    {
        return index < remap.Length ? remap[index] : index;
    }

    private static byte[] ReplaceAsciiPackageBytes(
        byte[] source,
        byte[] oldPackageBytes,
        byte[] newPackageBytes)
    {
        var result = new List<byte>(source.Length);

        for (var index = 0; index < source.Length;)
        {
            if (MatchesAt(source, index, oldPackageBytes))
            {
                result.AddRange(newPackageBytes);
                index += oldPackageBytes.Length;
            }
            else
            {
                result.Add(source[index++]);
            }
        }

        return result.Count == source.Length && result.SequenceEqual(source)
            ? source
            : result.ToArray();
    }

    private static bool MatchesAt(byte[] source, int offset, byte[] pattern)
    {
        return pattern.Length > 0 &&
               offset <= source.Length - pattern.Length &&
               source.AsSpan(offset, pattern.Length).SequenceEqual(pattern);
    }

    private static int Align4(int value)
    {
        return checked((value + 3) & ~3);
    }

    private static uint ReadUleb128(byte[] data, ref int offset)
    {
        uint value = 0;
        var shift = 0;

        while (offset < data.Length && shift <= 28)
        {
            var next = data[offset++];
            value |= (uint)(next & 0x7F) << shift;
            if ((next & 0x80) == 0)
            {
                return value;
            }

            shift += 7;
        }

        throw new InvalidDataException("DEX ULEB128 值无效。");
    }

    private static void WriteUleb128(Stream stream, uint value)
    {
        do
        {
            var next = (byte)(value & 0x7F);
            value >>= 7;
            if (value != 0)
            {
                next |= 0x80;
            }

            stream.WriteByte(next);
        }
        while (value != 0);
    }

    private static void RecalculateDexChecksums(byte[] dexData)
    {
        using var sha1 = SHA1.Create();
        var signature = sha1.ComputeHash(dexData, 32, dexData.Length - 32);
        Buffer.BlockCopy(signature, 0, dexData, 12, signature.Length);

        uint a = 1;
        uint b = 0;
        for (var index = 12; index < dexData.Length; index++)
        {
            a = (a + dexData[index]) % 65521;
            b = (b + a) % 65521;
        }

        WriteUInt32(dexData, 8, (b << 16) | a);
    }

    private static byte[] PatchAndroidManifest(
        byte[] manifestData,
        string packageName,
        string version,
        string appName)
    {
        const ushort XmlChunkType = 0x0003;
        const ushort StringPoolChunkType = 0x0001;
        const ushort StartElementChunkType = 0x0102;
        const byte StringValueType = 0x03;

        if (manifestData.Length < 8 ||
            ReadUInt16(manifestData, 0) != XmlChunkType)
        {
            return manifestData;
        }

        var rootHeaderSize = ReadUInt16(manifestData, 2);
        if (rootHeaderSize < 8 || rootHeaderSize > manifestData.Length - 8)
        {
            throw new InvalidDataException("AndroidManifest.xml 的 XML 头无效。");
        }

        var stringPoolOffset = rootHeaderSize;
        if (ReadUInt16(manifestData, stringPoolOffset) != StringPoolChunkType)
        {
            throw new InvalidDataException("AndroidManifest.xml 中未找到字符串池。");
        }

        var stringPool = AndroidStringPool.Parse(manifestData, stringPoolOffset);
        var stringPoolEnd = stringPoolOffset + stringPool.ChunkSize;
        var xmlTail = manifestData[stringPoolEnd..].ToArray();
        var attributePatches = new List<ManifestAttributePatch>();
        string? originalPackageName = null;

        for (var chunkOffset = stringPoolEnd; chunkOffset + 8 <= manifestData.Length;)
        {
            var chunkType = ReadUInt16(manifestData, chunkOffset);
            var chunkHeaderSize = ReadUInt16(manifestData, chunkOffset + 2);
            var chunkSize = ReadUInt32(manifestData, chunkOffset + 4);

            if (chunkSize < chunkHeaderSize ||
                chunkSize > manifestData.Length - chunkOffset)
            {
                throw new InvalidDataException("AndroidManifest.xml 中存在无效的 XML chunk。");
            }

            if (chunkType == StartElementChunkType && chunkHeaderSize >= 16)
            {
                var extensionOffset = chunkOffset + 16;
                if (extensionOffset + 20 <= manifestData.Length)
                {
                    var elementNameIndex = ReadUInt32(manifestData, extensionOffset + 4);
                    var elementName = stringPool.GetString(elementNameIndex);
                    var attributeStart = ReadUInt16(manifestData, extensionOffset + 8);
                    var attributeSize = ReadUInt16(manifestData, extensionOffset + 10);
                    var attributeCount = ReadUInt16(manifestData, extensionOffset + 12);
                    var attributesOffset = extensionOffset + attributeStart;

                    if (attributeSize >= 20 &&
                        attributesOffset >= chunkOffset &&
                        attributesOffset <= chunkOffset + chunkSize)
                    {
                        for (var index = 0; index < attributeCount; index++)
                        {
                            var attributeOffset = attributesOffset + index * attributeSize;
                            if (attributeOffset < attributesOffset ||
                                attributeOffset + 20 > chunkOffset + chunkSize)
                            {
                                break;
                            }

                            var nameIndex = ReadUInt32(manifestData, attributeOffset + 4);
                            var attributeName = stringPool.GetString(nameIndex);
                            var rawValueIndex = ReadUInt32(manifestData, attributeOffset + 8);
                            var valueType = manifestData[attributeOffset + 15];
                            var typedValueIndex = ReadUInt32(manifestData, attributeOffset + 16);
                            var originalValue = stringPool.GetString(
                                rawValueIndex != uint.MaxValue && rawValueIndex < stringPool.Count
                                    ? rawValueIndex
                                    : valueType == StringValueType
                                        ? typedValueIndex
                                        : uint.MaxValue);

                            if (string.Equals(attributeName, "package", StringComparison.Ordinal))
                            {
                                originalPackageName = originalValue;
                            }

                            var replacement = attributeName switch
                            {
                                "package" => packageName,
                                "versionName" => version,
                                "label" => appName,
                                _ => null
                            };

                            if (replacement is null &&
                                originalPackageName is not null &&
                                originalValue is not null &&
                                IsComponentNameAttribute(elementName, attributeName) &&
                                (originalValue.StartsWith(".", StringComparison.Ordinal) ||
                                 !originalValue.Contains('.', StringComparison.Ordinal)))
                            {
                                replacement = originalValue.StartsWith(".", StringComparison.Ordinal)
                                    ? originalPackageName + originalValue
                                    : originalPackageName + "." + originalValue;
                            }

                            if (replacement is null &&
                                originalPackageName is not null &&
                                originalValue is not null &&
                                IsPackageReferenceAttribute(elementName, attributeName) &&
                                IsPackageQualifiedValue(originalValue, originalPackageName))
                            {
                                replacement = packageName + originalValue[originalPackageName.Length..];
                            }

                            if (replacement is null)
                            {
                                continue;
                            }

                            var replacementIndex = stringPool.GetOrAdd(replacement);
                            attributePatches.Add(new ManifestAttributePatch(
                                attributeOffset - stringPoolEnd,
                                replacementIndex));
                        }
                    }
                }
            }

            chunkOffset += checked((int)chunkSize);
        }

        var rebuiltStringPool = stringPool.Build();
        foreach (var patch in attributePatches)
        {
            if (patch.AttributeOffset < 0 ||
                patch.AttributeOffset + 20 > xmlTail.Length)
            {
                continue;
            }

            WriteUInt32(xmlTail, patch.AttributeOffset + 8, patch.StringIndex);
            WriteUInt16(xmlTail, patch.AttributeOffset + 12, 8);
            xmlTail[patch.AttributeOffset + 14] = 0;
            xmlTail[patch.AttributeOffset + 15] = StringValueType;
            WriteUInt32(xmlTail, patch.AttributeOffset + 16, patch.StringIndex);
        }

        var result = new byte[rootHeaderSize + rebuiltStringPool.Length + xmlTail.Length];
        Buffer.BlockCopy(manifestData, 0, result, 0, rootHeaderSize);
        Buffer.BlockCopy(rebuiltStringPool, 0, result, rootHeaderSize, rebuiltStringPool.Length);
        Buffer.BlockCopy(xmlTail, 0, result, rootHeaderSize + rebuiltStringPool.Length, xmlTail.Length);
        WriteUInt32(result, 4, checked((uint)result.Length));

        return result;
    }

    private static bool IsComponentNameAttribute(string? elementName, string? attributeName)
    {
        if (!string.Equals(attributeName, "name", StringComparison.Ordinal))
        {
            return false;
        }

        return string.Equals(elementName, "application", StringComparison.Ordinal) ||
               string.Equals(elementName, "activity", StringComparison.Ordinal) ||
               string.Equals(elementName, "activity-alias", StringComparison.Ordinal) ||
               string.Equals(elementName, "service", StringComparison.Ordinal) ||
               string.Equals(elementName, "receiver", StringComparison.Ordinal) ||
               string.Equals(elementName, "provider", StringComparison.Ordinal);
    }

    private static bool IsPackageReferenceAttribute(string? elementName, string? attributeName)
    {
        if (string.Equals(elementName, "permission", StringComparison.Ordinal) &&
            string.Equals(attributeName, "name", StringComparison.Ordinal))
        {
            return true;
        }

        return string.Equals(attributeName, "authorities", StringComparison.Ordinal) ||
               string.Equals(attributeName, "permission", StringComparison.Ordinal) ||
               string.Equals(attributeName, "readPermission", StringComparison.Ordinal) ||
               string.Equals(attributeName, "writePermission", StringComparison.Ordinal);
    }

    private static bool IsPackageQualifiedValue(string value, string packageName)
    {
        return string.Equals(value, packageName, StringComparison.Ordinal) ||
               value.StartsWith(packageName + ".", StringComparison.Ordinal);
    }

    private readonly record struct ManifestAttributePatch(int AttributeOffset, uint StringIndex);

    private sealed class AndroidStringPool
    {
        private const ushort StringPoolChunkType = 0x0001;
        private const uint Utf8Flag = 0x00000100;

        private readonly uint _flags;
        private readonly uint[] _styleOffsets;
        private readonly byte[] _styleData;
        private readonly Dictionary<string, uint> _indexByValue = new(StringComparer.Ordinal);

        private AndroidStringPool(
            int chunkSize,
            uint flags,
            uint[] styleOffsets,
            byte[] styleData,
            List<string> strings)
        {
            ChunkSize = chunkSize;
            _flags = flags;
            _styleOffsets = styleOffsets;
            _styleData = styleData;
            Strings = strings;

            for (uint index = 0; index < Strings.Count; index++)
            {
                _indexByValue.TryAdd(Strings[(int)index], index);
            }
        }

        public int ChunkSize { get; }
        public List<string> Strings { get; }
        public int Count => Strings.Count;
        private bool IsUtf8 => (_flags & Utf8Flag) != 0;

        public static AndroidStringPool Parse(byte[] data, int offset)
        {
            var headerSize = ReadUInt16(data, offset + 2);
            var chunkSize = checked((int)ReadUInt32(data, offset + 4));
            var stringCount = checked((int)ReadUInt32(data, offset + 8));
            var styleCount = checked((int)ReadUInt32(data, offset + 12));
            var flags = ReadUInt32(data, offset + 16);
            var stringsStart = checked((int)ReadUInt32(data, offset + 20));
            var stylesStart = ReadUInt32(data, offset + 24);

            if (headerSize < 28 ||
                chunkSize < headerSize ||
                offset + chunkSize > data.Length ||
                stringsStart < headerSize ||
                offset + stringsStart > offset + chunkSize)
            {
                throw new InvalidDataException("AndroidManifest.xml 的字符串池无效。");
            }

            var stringOffsetsStart = offset + headerSize;
            var styleOffsetsStart = stringOffsetsStart + stringCount * 4;
            var stringDataStart = offset + stringsStart;
            var strings = new List<string>(stringCount);

            for (var index = 0; index < stringCount; index++)
            {
                var relativeOffset = checked((int)ReadUInt32(data, stringOffsetsStart + index * 4));
                var stringOffset = stringDataStart + relativeOffset;
                strings.Add(ReadPoolString(data, stringOffset, (flags & Utf8Flag) != 0));
            }

            var styleOffsets = new uint[styleCount];
            for (var index = 0; index < styleCount; index++)
            {
                styleOffsets[index] = ReadUInt32(data, styleOffsetsStart + index * 4);
            }

            var styleData = Array.Empty<byte>();
            if (stylesStart != 0)
            {
                var styleDataStart = offset + checked((int)stylesStart);
                if (styleDataStart < offset || styleDataStart > offset + chunkSize)
                {
                    throw new InvalidDataException("AndroidManifest.xml 的样式数据无效。");
                }

                styleData = data[styleDataStart..(offset + chunkSize)];
            }

            return new AndroidStringPool(chunkSize, flags, styleOffsets, styleData, strings);
        }

        public uint GetOrAdd(string value)
        {
            if (_indexByValue.TryGetValue(value, out var existingIndex))
            {
                return existingIndex;
            }

            var index = checked((uint)Strings.Count);
            Strings.Add(value);
            _indexByValue[value] = index;
            return index;
        }

        public string? GetString(uint index)
        {
            return index < Strings.Count ? Strings[(int)index] : null;
        }

        public byte[] Build()
        {
            using var stringDataStream = new MemoryStream();
            var stringOffsets = new uint[Strings.Count];

            for (var index = 0; index < Strings.Count; index++)
            {
                stringOffsets[index] = checked((uint)stringDataStream.Position);
                if (IsUtf8)
                {
                    WriteUtf8String(stringDataStream, Strings[index]);
                }
                else
                {
                    WriteUtf16String(stringDataStream, Strings[index]);
                }
            }

            var stringData = stringDataStream.ToArray();
            var paddedStringDataLength = Align4(stringData.Length);
            var newStringsStart = 28 + Strings.Count * 4 + _styleOffsets.Length * 4;
            var newStylesStart = _styleOffsets.Length == 0
                ? 0
                : newStringsStart + paddedStringDataLength;
            var newChunkSize = _styleOffsets.Length == 0
                ? newStringsStart + paddedStringDataLength
                : newStylesStart + _styleData.Length;
            var result = new byte[newChunkSize];

            WriteUInt16(result, 0, StringPoolChunkType);
            WriteUInt16(result, 2, 28);
            WriteUInt32(result, 4, checked((uint)newChunkSize));
            WriteUInt32(result, 8, checked((uint)Strings.Count));
            WriteUInt32(result, 12, checked((uint)_styleOffsets.Length));
            WriteUInt32(result, 16, _flags);
            WriteUInt32(result, 20, checked((uint)newStringsStart));
            WriteUInt32(result, 24, checked((uint)newStylesStart));

            var offsetPosition = 28;
            foreach (var stringOffset in stringOffsets)
            {
                WriteUInt32(result, offsetPosition, stringOffset);
                offsetPosition += 4;
            }

            foreach (var styleOffset in _styleOffsets)
            {
                WriteUInt32(result, offsetPosition, styleOffset);
                offsetPosition += 4;
            }

            Buffer.BlockCopy(stringData, 0, result, newStringsStart, stringData.Length);
            if (_styleData.Length > 0)
            {
                Buffer.BlockCopy(_styleData, 0, result, newStylesStart, _styleData.Length);
            }

            return result;
        }

        private static string ReadPoolString(byte[] data, int offset, bool isUtf8)
        {
            if (isUtf8)
            {
                var cursor = offset;
                _ = ReadUtf8Length(data, ref cursor);
                var byteLength = ReadUtf8Length(data, ref cursor);
                if (cursor + byteLength > data.Length)
                {
                    throw new InvalidDataException("AndroidManifest.xml 的 UTF-8 字符串无效。");
                }

                return Encoding.UTF8.GetString(data, cursor, byteLength);
            }

            var utf16Cursor = offset;
            var characterLength = ReadUtf16Length(data, ref utf16Cursor);
            var byteLengthUtf16 = checked(characterLength * 2);
            if (utf16Cursor + byteLengthUtf16 > data.Length)
            {
                throw new InvalidDataException("AndroidManifest.xml 的 UTF-16 字符串无效。");
            }

            return Encoding.Unicode.GetString(data, utf16Cursor, byteLengthUtf16);
        }

        private static int ReadUtf8Length(byte[] data, ref int offset)
        {
            var first = data[offset++];
            if ((first & 0x80) == 0)
            {
                return first;
            }

            return ((first & 0x7F) << 8) | data[offset++];
        }

        private static int ReadUtf16Length(byte[] data, ref int offset)
        {
            var first = ReadUInt16(data, offset);
            offset += 2;
            if ((first & 0x8000) == 0)
            {
                return first;
            }

            var second = ReadUInt16(data, offset);
            offset += 2;
            return ((first & 0x7FFF) << 16) | second;
        }

        private static void WriteUtf8String(Stream stream, string value)
        {
            var utf8 = Encoding.UTF8.GetBytes(value);
            WriteUtf8Length(stream, value.Length);
            WriteUtf8Length(stream, utf8.Length);
            stream.Write(utf8);
            stream.WriteByte(0);
        }

        private static void WriteUtf16String(Stream stream, string value)
        {
            WriteUtf16Length(stream, value.Length);
            var utf16 = Encoding.Unicode.GetBytes(value);
            stream.Write(utf16);
            stream.WriteByte(0);
            stream.WriteByte(0);
        }

        private static void WriteUtf8Length(Stream stream, int length)
        {
            if (length > 0x7F)
            {
                stream.WriteByte((byte)((length >> 8) | 0x80));
                stream.WriteByte((byte)length);
            }
            else
            {
                stream.WriteByte((byte)length);
            }
        }

        private static void WriteUtf16Length(Stream stream, int length)
        {
            if (length > 0x7FFF)
            {
                WriteUInt16(stream, (ushort)((length >> 16) | 0x8000));
                WriteUInt16(stream, (ushort)length);
            }
            else
            {
                WriteUInt16(stream, (ushort)length);
            }
        }

        private static int Align4(int value)
        {
            return (value + 3) & ~3;
        }
    }

    private static ushort ReadUInt16(byte[] data, int offset)
    {
        return BinaryPrimitives.ReadUInt16LittleEndian(data.AsSpan(offset, 2));
    }

    private static uint ReadUInt32(byte[] data, int offset)
    {
        return BinaryPrimitives.ReadUInt32LittleEndian(data.AsSpan(offset, 4));
    }

    private static void WriteUInt16(byte[] data, int offset, ushort value)
    {
        BinaryPrimitives.WriteUInt16LittleEndian(data.AsSpan(offset, 2), value);
    }

    private static void WriteUInt32(byte[] data, int offset, uint value)
    {
        BinaryPrimitives.WriteUInt32LittleEndian(data.AsSpan(offset, 4), value);
    }

    private static void WriteUInt16(Stream stream, ushort value)
    {
        Span<byte> bytes = stackalloc byte[2];
        BinaryPrimitives.WriteUInt16LittleEndian(bytes, value);
        stream.Write(bytes);
    }

    private void ReplaceApkIcon(string apkPath, string iconPath)
    {
        Log($"替换图标: {iconPath}");
        var entriesToSkip = new HashSet<string>(StringComparer.Ordinal)
        {
            "META-INF/",
            "META-INF/MANIFEST.MF",
            "META-INF/CERT.RSA",
            "META-INF/CERT.SF"
        };

        var tempFile = apkPath + ".tmp";
        var iconData = File.ReadAllBytes(iconPath);

        using (var zip = ZipFile.OpenRead(apkPath))
        using (var output = ZipFile.Open(tempFile, ZipArchiveMode.Create))
        {
            foreach (var entry in zip.Entries)
            {
                if (entriesToSkip.Any(e => entry.FullName.StartsWith(e, StringComparison.Ordinal)))
                    continue;

                var newEntry = output.CreateEntry(entry.FullName, GetApkCompressionLevel(entry.FullName));
                    using var newStream = newEntry.Open();

                if (entry.FullName.EndsWith("ic_launcher.png", StringComparison.Ordinal) ||
                    entry.FullName.EndsWith("ic_launcher_round.png", StringComparison.Ordinal) ||
                    entry.FullName.EndsWith("icon.png", StringComparison.Ordinal) ||
                    entry.FullName.EndsWith("adaptive_icon.png", StringComparison.Ordinal) ||
                    entry.FullName.EndsWith("icon.xml", StringComparison.Ordinal))
                {
                    newStream.Write(iconData, 0, iconData.Length);
                }
                else
                {
                    using var stream = entry.Open();
                    stream.CopyTo(newStream);
                }
            }
        }

        File.Delete(apkPath);
        File.Move(tempFile, apkPath);
        Log("图标替换完成");
    }

    private void ReplaceApkSplashScreen(string apkPath, string splashPath)
    {
        Log($"替换加载图片: {splashPath}");
        var entriesToSkip = new HashSet<string>(StringComparer.Ordinal)
        {
            "META-INF/"
        };

        var tempFile = apkPath + ".tmp";
        var splashData = File.ReadAllBytes(splashPath);
        var replaced = false;

        using (var zip = ZipFile.OpenRead(apkPath))
        using (var output = ZipFile.Open(tempFile, ZipArchiveMode.Create))
        {
            foreach (var entry in zip.Entries)
            {
                if (entriesToSkip.Any(e => entry.FullName.StartsWith(e, StringComparison.Ordinal)))
                {
                    continue;
                }

                var newEntry = output.CreateEntry(
                    entry.FullName,
                    GetApkCompressionLevel(entry.FullName));
                using var newStream = newEntry.Open();

                if (entry.FullName.EndsWith(
                        "ic_cdv_splashscreen.png",
                        StringComparison.OrdinalIgnoreCase))
                {
                    newStream.Write(splashData, 0, splashData.Length);
                    replaced = true;
                }
                else
                {
                    using var stream = entry.Open();
                    stream.CopyTo(newStream);
                }
            }
        }

        if (!replaced)
        {
            File.Delete(tempFile);
            Log("APK 中未找到 ic_cdv_splashscreen.png，跳过加载图片替换", true);
            return;
        }

        File.Delete(apkPath);
        File.Move(tempFile, apkPath);
        Log("加载图片替换完成");
    }

    private async Task ZipAlignApkAsync(string apkPath, CancellationToken cancellationToken)
    {
        var zipalignExe = Path.Combine(RuntimePaths.ToolsDirectory, "zipalign.exe");

        if (!File.Exists(zipalignExe))
        {
            Log("zipalign 未找到，跳过对齐步骤");
            return;
        }

        var tempFile = apkPath + ".aligned";
        var psi = new ProcessStartInfo
        {
            FileName = zipalignExe,
            Arguments = $"-f 4 \"{apkPath}\" \"{tempFile}\"",
            CreateNoWindow = true,
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true
        };

        using var process = Process.Start(psi);
        if (process == null) throw new InvalidOperationException("无法启动 zipalign");

        var stdoutTask = process.StandardOutput.ReadToEndAsync(cancellationToken);
        var stderrTask = process.StandardError.ReadToEndAsync(cancellationToken);

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
                // Ignore kill errors while cancelling.
            }
        });

        await process.WaitForExitAsync(cancellationToken);
        var stdout = await stdoutTask;
        var stderr = await stderrTask;

        if (process.ExitCode != 0)
        {
            Log($"zipalign 警告: {stderr}", isError: true);
            if (File.Exists(tempFile))
            {
                File.Delete(apkPath);
                File.Move(tempFile, apkPath);
            }
        }
        else
        {
            File.Delete(apkPath);
            File.Move(tempFile, apkPath);
            Log("APK 对齐完成");
        }
    }

    private async Task SignApkAsync(string apkPath, CancellationToken cancellationToken)
    {
        var toolsDirFull = RuntimePaths.ToolsDirectory;

        var javaExe = PreparePortableJava(toolsDirFull);
        var apksignerJar = Path.Combine(toolsDirFull, "apksigner.jar");
        var keystorePath = Path.Combine(toolsDirFull, "w.jks");

        if (!File.Exists(javaExe))
        {
            Log($"JRE 未找到或无法准备: {javaExe}，跳过签名", true);
            return;
        }
        if (!File.Exists(apksignerJar))
        {
            Log($"apksigner 未找到: {apksignerJar}，跳过签名", true);
            return;
        }
        if (!File.Exists(keystorePath))
        {
            Log($"签名证书未找到: {keystorePath}，跳过签名", true);
            return;
        }

        Log("开始签名 APK...");

        var signedApkPath = apkPath + ".signed";
        var psi = new ProcessStartInfo
        {
            FileName = javaExe,
            ArgumentList =
            {
                "-jar",
                apksignerJar,
                "sign",
                "--ks",
                keystorePath,
                "--ks-key-alias",
                "key0",
                "--ks-pass",
                "pass:123456789",
                "--key-pass",
                "pass:123456789",
                "--in",
                apkPath,
                "--out",
                signedApkPath
            },
            CreateNoWindow = true,
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            StandardOutputEncoding = Encoding.UTF8,
            StandardErrorEncoding = Encoding.UTF8
        };

        using var process = Process.Start(psi);
        if (process == null) throw new InvalidOperationException("无法启动 apksigner");

        await process.WaitForExitAsync(cancellationToken);

        var stdout = await process.StandardOutput.ReadToEndAsync(cancellationToken);
        var stderr = await process.StandardError.ReadToEndAsync(cancellationToken);

        if (process.ExitCode == 0)
        {
            File.Delete(apkPath);
            File.Move(signedApkPath, apkPath);
            Log("APK 签名成功");
        }
        else
        {
            if (File.Exists(signedApkPath))
            {
                File.Delete(signedApkPath);
            }

            Log($"APK 签名失败: {stderr}", true);
            throw new InvalidOperationException($"APK 签名失败: {stderr}");
        }
    }

    private string PreparePortableJava(string toolsDir)
    {
        var sourceJre = Path.Combine(toolsDir, "jre");
        var sourceJava = Path.Combine(sourceJre, "bin", "java.exe");
        if (!File.Exists(sourceJava))
        {
            return sourceJava;
        }

        var cacheRoot = Path.Combine(Path.GetTempPath(), "GameMaker-Mobiler", "jre");
        var cacheJre = Path.Combine(cacheRoot, "runtime");
        var cacheJava = Path.Combine(cacheJre, "bin", "java.exe");
        var markerPath = Path.Combine(cacheRoot, "source.marker");
        var sourceMarker = GetDirectoryFingerprint(sourceJre);

        try
        {
            if (!File.Exists(cacheJava) ||
                !string.Equals(
                    File.Exists(markerPath) ? File.ReadAllText(markerPath) : null,
                    sourceMarker,
                    StringComparison.Ordinal))
            {
                if (Directory.Exists(cacheJre))
                {
                    Directory.Delete(cacheJre, recursive: true);
                }

                Directory.CreateDirectory(cacheRoot);
                CopyDirectoryVerbatim(sourceJre, cacheJre);
                File.WriteAllText(markerPath, sourceMarker, Encoding.UTF8);
            }

            return cacheJava;
        }
        catch (Exception ex)
        {
            Log($"便携 JRE 准备失败，将尝试直接使用 Tools\\jre: {ex.Message}", true);
            return sourceJava;
        }
    }

    private static string GetDirectoryFingerprint(string directory)
    {
        var files = Directory
            .EnumerateFiles(directory, "*", SearchOption.AllDirectories)
            .OrderBy(path => path, StringComparer.OrdinalIgnoreCase);

        using var sha256 = SHA256.Create();
        using var stream = new MemoryStream();
        using var writer = new StreamWriter(stream, Encoding.UTF8, leaveOpen: true);

        foreach (var file in files)
        {
            var info = new FileInfo(file);
            writer.Write(file);
            writer.Write('|');
            writer.Write(info.Length);
            writer.Write('|');
            writer.Write(info.LastWriteTimeUtc.Ticks);
            writer.WriteLine();
        }

        writer.Flush();
        return Convert.ToHexString(sha256.ComputeHash(stream.ToArray()));
    }

    private static string SanitizeFileName(string name)
    {
        var invalidChars = Path.GetInvalidFileNameChars();
        var safe = new string(invalidChars.Aggregate(name, (c, ch) => c.Replace(ch, '_')));
        return string.IsNullOrWhiteSpace(safe) ? "MyGame" : safe.Trim();
    }
}

public sealed class TempDirectory : IDisposable
{
    public string Path { get; }

    public TempDirectory()
    {
        Path = System.IO.Path.Combine(System.IO.Path.GetTempPath(), $"gm_mobiler_{Guid.NewGuid():N}");
        Directory.CreateDirectory(Path);
    }

    public void Dispose()
    {
        try
        {
            if (Directory.Exists(Path))
                Directory.Delete(Path, recursive: true);
        }
        catch { }
    }
}

