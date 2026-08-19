// 沐白
using System;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Linq;
using UndertaleModLib.Util;

EnsureDataLoaded();
string dataPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "OldUteAndroidFix");
UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data);

foreach (string filePath in Directory.GetFiles(dataPath, "*.gml"))
{
　string codeName = Path.GetFileNameWithoutExtension(filePath);
    if (Data.Code.ByName(codeName) is not null)
    {
        QueueGMLFile(filePath);
    }
}

importGroup.Import();
ScriptMessage("控制台与路径成功修复！");
void QueueGMLFile(string path)
{
    importGroup.QueueReplace(Path.GetFileNameWithoutExtension(path), File.ReadAllText(path));
}
