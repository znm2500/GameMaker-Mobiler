using System;
using System.IO;
using System.Linq;

namespace GameMaker_Mobiler.Services;

internal static class RuntimePaths
{
    public static string ToolsDirectory => FindDirectory("Tools");

    public static string TemplatesDirectory => FindDirectory("GMS2 APK");

    private static string FindDirectory(string name)
    {
        var baseDir = AppDomain.CurrentDomain.BaseDirectory;
        var candidates = new[]
        {
            Path.Combine(baseDir, name),
            Path.Combine(baseDir, "..", "..", "..", "..", name)
        };

        return Path.GetFullPath(candidates.FirstOrDefault(Directory.Exists) ?? candidates[0]);
    }
}
