//脚本 by 沐白_official、协助 by 秋冥散雨_Genouka
//Mobilekey by 南省Crosu
using System;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Linq;
using System.Windows;
using UndertaleModLib.Util;
using UndertaleModLib;
using UndertaleModLib.Models;
using static UndertaleModLib.Models.UndertaleSound;
using static UndertaleModLib.UndertaleData;
using System.Threading.Tasks;

EnsureDataLoaded();
ScriptMessage("移动端脚本 By 沐白_official\n部分代码和协助 By 秋冥散雨_Genouka");
bool shouldRunScripts = true;
string scriptsBasePath = Path.Combine(Path.GetDirectoryName(ScriptPath), "MobileScript");
if (shouldRunScripts)
{
    bool fontResult = RunUMTScript(Path.Combine(scriptsBasePath, "ImportFonts.csx"));
    if (fontResult == false)
    {
        ScriptError("ImportFonts.csx failed!");
        return;
    }
    bool graphicsResult = RunUMTScript(Path.Combine(scriptsBasePath, "ImportGraphics.csx"));
    if (graphicsResult == false)
    {
        ScriptError("ImportGraphics.csx failed!");
        return;
    }

    int maxCount = 1;

    UndertaleEmbeddedAudio audioFile = null;
    int audioID = -1;
    int audioGroupID = -1;
    int embAudioID = -1;
    bool usesAGRP = (Data.AudioGroups.Count > 0);

    if (!usesAGRP)
    {
        ScriptWarning("This game doesn't use audiogroups.\nImporting to external audiogroups is disabled.");
    }

    string importFolder = Path.Combine(scriptsBasePath, "MobileSound");
    if (importFolder is null)
    {
        throw new ScriptException("The import folder was not set.");
    }

    string[] dirFiles = Directory.GetFiles(importFolder);
    string folderName = new DirectoryInfo(importFolder).Name;
    bool replaceSoundPropertiesCheck = true;

    bool GeneralSound_embedSound = false;
    bool GeneralSound_decodeLoad = false;
    bool GeneralSound_needAGRP = false;
    bool manuallySpecifyEverySound = !true;
    if (!manuallySpecifyEverySound)
    {
        GeneralSound_embedSound = true;
        if (GeneralSound_embedSound)
        {
            GeneralSound_decodeLoad = true;
        }
        if (GeneralSound_embedSound && Data.AudioGroups.Count > 0)
        {
            GeneralSound_needAGRP = false;
        }
    }

    maxCount = dirFiles.Length;
    SetProgressBar(null, "Importing sounds", 0, maxCount);
    StartProgressBarUpdater();

    // 删除 SyncBinding 调用
    // SyncBinding("AudioGroups, EmbeddedAudio, Sounds, Strings", true);

    await Task.Run(() =>
    {
        foreach (string file in dirFiles)
        {
            IncProgressLocal();

            string filename = Path.GetFileName(file);
            if (!(filename.EndsWith(".ogg", StringComparison.InvariantCultureIgnoreCase) || filename.EndsWith(".wav", StringComparison.InvariantCultureIgnoreCase)))
            {
                // Ignore invalid file extensions.
                continue;
            }
            string soundName = Path.GetFileNameWithoutExtension(file);
            bool isOGG = Path.GetExtension(filename).ToLower() == ".ogg";
            bool embedSound = false;
            bool decodeLoad = false;
            if (isOGG && manuallySpecifyEverySound)
            {
                embedSound = true;
                decodeLoad = false;
                if (embedSound)
                {
                    decodeLoad = true;
                }
            }
            else if (isOGG && !manuallySpecifyEverySound)
            {
                embedSound = GeneralSound_embedSound;
                decodeLoad = GeneralSound_decodeLoad;
            }
            else
            {
                // WAV cannot be external
                embedSound = true;
                decodeLoad = false;
            }
            string audioGroupName = "";
            string folderName = new DirectoryInfo(importFolder).Name;
            bool needAGRP = false;

            // Search for an existing sound with the given name.
            UndertaleSound existingSound = null;
            for (var i = 0; i < Data.Sounds.Count; i++)
            {
                if (Data.Sounds[i]?.Name?.Content == soundName)
                {
                    existingSound = Data.Sounds[i];
                    if (manuallySpecifyEverySound)
                    {
                        ScriptMessage($"Sound \"{existingSound.Name.Content}\" already exists in the game; it will be replaced instead of added.");
                    }
                    break;
                }
            }

            // Try to find an audiogroup, when not updating an existing sound.
            if (embedSound && usesAGRP && existingSound is null)
            {
                if (manuallySpecifyEverySound)
                {
                    needAGRP = true;
                }
                else
                {
                    needAGRP = GeneralSound_needAGRP;
                }
            }
            if (needAGRP && usesAGRP && embedSound)
            {
                audioGroupName = folderName;

                if (audioGroupID == -1)
                {
                    // Find the audio group we need.
                    for (int i = 0; i < Data.AudioGroups.Count; i++)
                    {
                        if (Data.AudioGroups[i]?.Name?.Content == audioGroupName)
                        {
                            audioGroupID = i;
                            break;
                        }
                    }
                    if (audioGroupID == -1)
                    {
                        // Still -1? Create a new one...
                        File.WriteAllBytes(Path.Combine(Path.GetDirectoryName(FilePath), $"audiogroup{Data.AudioGroups.Count}.dat"), Convert.FromBase64String("Rk9STQwAAABBVURPBAAAAAAAAAA="));
                        UndertaleAudioGroup newAudioGroup = new()
                        {
                            Name = Data.Strings.MakeString(audioGroupName),
                        };
                        // 新增 AudioGroup 必须主线程操作
                        MainThreadAction(() =>
                        {
                            Data.AudioGroups.Add(newAudioGroup);
                        });
                    }
                }
            }

            // If this is an existing sound, use its audio group ID.
            if (existingSound is not null)
            {
                audioGroupID = existingSound.GroupID;
            }

            // If the audiogroup ID is for the builtin audiogroup ID, it's embedded in the main data file and doesn't need to be loaded.
            if (audioGroupID == Data.GetBuiltinSoundGroupID())
            {
                needAGRP = false;
            }

            // Create embedded audio entry if required.
            UndertaleEmbeddedAudio soundData = null;
            if ((embedSound && !needAGRP) || needAGRP)
            {
                soundData = new UndertaleEmbeddedAudio() { Data = File.ReadAllBytes(file) };
                // 不要直接在这里 Add，放到 MainThreadAction 中
            }

            // Update external audio group file if required.
            if (needAGRP)
            {
                // Load audiogroup into memory.
                UndertaleData audioGroupDat;
                string relativeAudioGroupPath;
                if (audioGroupID < Data.AudioGroups.Count && Data.AudioGroups[audioGroupID] is UndertaleAudioGroup { Path.Content: string customRelativePath })
                {
                    relativeAudioGroupPath = customRelativePath;
                }
                else
                {
                    relativeAudioGroupPath = $"audiogroup{audioGroupID}.dat";
                }
                string audioGroupPath = Path.Combine(Path.GetDirectoryName(FilePath), relativeAudioGroupPath);
                using (FileStream audioGroupReadStream = new(audioGroupPath, FileMode.Open, FileAccess.Read))
                {
                    audioGroupDat = UndertaleIO.Read(audioGroupReadStream);
                }

                // Add the EmbeddedAudio entry to the audiogroup data.
                audioGroupDat.EmbeddedAudio.Add(soundData);
                if (existingSound is not null)
                {
                    audioGroupDat.EmbeddedAudio.Remove(existingSound.AudioFile);
                }
                audioID = audioGroupDat.EmbeddedAudio.Count - 1;

                // Write audio group back to disk (后台线程操作文件)
                using FileStream audioGroupWriteStream = new(audioGroupPath, FileMode.Create);
                UndertaleIO.Write(audioGroupWriteStream, audioGroupDat);
            }

            // Determine sound flags.
            UndertaleSound.AudioEntryFlags flags = UndertaleSound.AudioEntryFlags.Regular;
            if (isOGG && embedSound && decodeLoad)
            {
                // OGG, embed, decode on load.
                flags = UndertaleSound.AudioEntryFlags.IsEmbedded | UndertaleSound.AudioEntryFlags.IsCompressed | UndertaleSound.AudioEntryFlags.Regular;
            }
            if (isOGG && embedSound && !decodeLoad)
            {
                // OGG, embed, not decode on load.
                flags = UndertaleSound.AudioEntryFlags.IsCompressed | UndertaleSound.AudioEntryFlags.Regular;
            }
            if (!isOGG)
            {
                // WAV, always embed.
                flags = UndertaleSound.AudioEntryFlags.IsEmbedded | UndertaleSound.AudioEntryFlags.Regular;
            }
            if (isOGG && !embedSound)
            {
                // OGG, external.
                flags = UndertaleSound.AudioEntryFlags.Regular;
                audioID = -1;
            }

            // Determine final embedded audio reference (or null).
            UndertaleEmbeddedAudio finalAudioReference = null;
            if (!embedSound)
            {
                finalAudioReference = null;
            }
            if (embedSound && !needAGRP)
            {
                // 此时 soundData 已创建，但还未加入 Data.EmbeddedAudio，我们在 MainThreadAction 中添加
                finalAudioReference = soundData; // 暂存引用
            }
            if (embedSound && needAGRP)
            {
                finalAudioReference = null;
            }

            // Determine final audio group reference (or null).
            UndertaleAudioGroup finalGroupReference = null;
            if (!usesAGRP)
            {
                finalGroupReference = null;
            }
            else
            {
                finalGroupReference = needAGRP ? Data.AudioGroups[audioGroupID] : Data.AudioGroups[Data.GetBuiltinSoundGroupID()];
            }

            // ---------- 所有对 Data 的修改必须放在 MainThreadAction 中 ----------
            MainThreadAction(() =>
            {
                // 如果 needAGRP 为 false 且 embedSound 为 true，我们需要将 soundData 添加到 Data.EmbeddedAudio
                if (embedSound && !needAGRP)
                {
                    // 如果 existingSound 不为 null，可能需要先移除旧的 EmbeddedAudio
                    if (existingSound is not null && existingSound.AudioFile is not null)
                    {
                        Data.EmbeddedAudio.Remove(existingSound.AudioFile);
                    }
                    Data.EmbeddedAudio.Add(soundData);
                    embAudioID = Data.EmbeddedAudio.Count - 1;
                    // 更新 finalAudioReference 为实际添加后的引用
                    finalAudioReference = Data.EmbeddedAudio[embAudioID];
                }
                else if (embedSound && needAGRP)
                {
                    // 对于 needAGRP，soundData 已经添加到 audioGroupDat 中，但 audioGroupDat 是独立的，不需要动 Data.EmbeddedAudio
                    // 但也要处理 existingSound 的 AudioFile 移除
                    if (existingSound is not null && existingSound.AudioFile is not null)
                    {
                        Data.EmbeddedAudio.Remove(existingSound.AudioFile);
                    }
                    // 注意：此时 audioID 是 audioGroupDat 中的索引，不是 Data 的
                }

                // 更新或创建 Sound
                if (existingSound is null)
                {
                    UndertaleSound newSound = new()
                    {
                        Name = Data.Strings.MakeString(soundName),
                        Flags = flags,
                        Type = isOGG ? Data.Strings.MakeString(".ogg") : Data.Strings.MakeString(".wav"),
                        File = Data.Strings.MakeString(filename),
                        Effects = 0,
                        Volume = 1.0f,
                        Pitch = 1.0f,
                        AudioID = audioID,
                        AudioFile = finalAudioReference,
                        AudioGroup = finalGroupReference,
                        GroupID = needAGRP ? audioGroupID : Data.GetBuiltinSoundGroupID()
                    };
                    Data.Sounds.Add(newSound);
                }
                else if (replaceSoundPropertiesCheck)
                {
                    existingSound.Flags = flags;
                    existingSound.Type = isOGG ? Data.Strings.MakeString(".ogg") : Data.Strings.MakeString(".wav");
                    existingSound.File = Data.Strings.MakeString(filename);
                    existingSound.Effects = 0;
                    existingSound.Volume = 1.0f;
                    existingSound.Pitch = 1.0f;
                    existingSound.AudioID = audioID;
                    existingSound.AudioFile = finalAudioReference;
                    existingSound.AudioGroup = finalGroupReference;
                    existingSound.GroupID = needAGRP ? audioGroupID : Data.GetBuiltinSoundGroupID();
                }
                else
                {
                    existingSound.AudioFile = finalAudioReference;
                    existingSound.AudioID = audioID;
                }
            });
        }
    });

    // 删除 DisableAllSyncBindings 调用
    // DisableAllSyncBindings();

    await StopProgressBarUpdater();
    ScriptMessage("键盘音效导入成功！");

    void IncProgressLocal()
    {
        if (GetProgress() < maxCount)
        {
            IncrementProgress();
        }
    }
    ScriptMessage("移动端前置脚本执行成功！");
}
else
{
    ScriptMessage("已跳过移动端前置脚本执行");
}

// -------------- 下面的 MobileKey 添加部分保持不变 --------------
string displayName = Data.GeneralInfo?.DisplayName?.Content.ToLower();
string keyOption = "Button3";

string dataPath0 = Path.Combine(Path.GetDirectoryName(scriptsBasePath), "MobileScript/" + "TouchControls_data");
string dataPath1 = Path.Combine(Path.GetDirectoryName(scriptsBasePath), "MobileScript/" + "TouchControls_data_button");
string dataPath2 = Path.Combine(Path.GetDirectoryName(scriptsBasePath), "MobileScript/" + "MobileKeyCode" + keyOption);
string dataPath3 = Path.Combine(Path.GetDirectoryName(scriptsBasePath), "MobileScript/" + "mobilecont");

Dictionary<string, UndertaleEmbeddedTexture> textures = new Dictionary<string, UndertaleEmbeddedTexture>();
UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data);

string JoystickCreate = File.ReadAllText(Path.Combine(dataPath0, "gml_Object_obj_mobilecontrols_Create_0.gml"));
string JoystickButtonCreate = File.ReadAllText(Path.Combine(dataPath1, "gml_Object_obj_mobilecontrols_button_Create_0.gml"));
string MobilekeyCreate = File.ReadAllText(Path.Combine(dataPath2, "gml_Object_obj_mobilekey_Create_0.gml"));
string MbContMobileCreate = File.ReadAllText(Path.Combine(dataPath3, "gml_Object_mb_cont_mobile_Create_0.gml"));

importGroup.QueueReplace("gml_Object_obj_mobilecontrols_Create_0", JoystickCreate);
QueueGMLFile(Path.Combine(dataPath0, "gml_Object_obj_mobilecontrols_Draw_75.gml"));
QueueGMLFile(Path.Combine(dataPath0, "gml_Object_obj_mobilecontrols_Other_4.gml"));
Data.Scripts.Add(new UndertaleScript() { Name = Data.Strings.MakeString("scr_add_keys"), Code = Data.Code.ByName("gml_Object_obj_mobilecontrols_Other_4") });
QueueGMLFile(Path.Combine(dataPath0, "gml_Object_obj_mobilecontrols_Step_0.gml"));
QueueGMLFile(Path.Combine(dataPath0, "gml_Object_obj_mobilecontrols_CleanUp_0.gml"));

var Joystick = Data.GameObjects.ByName("obj_mobilecontrols");
Joystick.Persistent = true;

importGroup.QueueReplace("gml_Object_obj_mobilecontrols_button_Create_0", JoystickButtonCreate);
QueueGMLFile(Path.Combine(dataPath1, "gml_Object_obj_mobilecontrols_button_Draw_75.gml"));
QueueGMLFile(Path.Combine(dataPath1, "gml_Object_obj_mobilecontrols_button_Other_4.gml"));
Data.Scripts.Add(new UndertaleScript() { Name = Data.Strings.MakeString("scr_add_keys_button"), Code = Data.Code.ByName("gml_Object_obj_mobilecontrols_button_Other_4") });
QueueGMLFile(Path.Combine(dataPath1, "gml_Object_obj_mobilecontrols_button_Step_0.gml"));
QueueGMLFile(Path.Combine(dataPath1, "gml_Object_obj_mobilecontrols_button_CleanUp_0.gml"));

var JoystickButton = Data.GameObjects.ByName("obj_mobilecontrols_button");
JoystickButton.Persistent = true;

importGroup.QueueReplace("gml_Object_obj_mobilekey_Create_0", MobilekeyCreate);
QueueGMLFile(Path.Combine(dataPath2, "gml_Object_obj_mobilekey_Draw_75.gml"));
QueueGMLFile(Path.Combine(dataPath2, "gml_Object_obj_mobilekey_Step_0.gml"));

var Mobilekey = Data.GameObjects.ByName("obj_mobilekey");
Mobilekey.Persistent = true;

importGroup.QueueReplace("gml_Object_mb_cont_mobile_Create_0", MbContMobileCreate);
QueueGMLFile(Path.Combine(dataPath3, "gml_Object_mb_cont_mobile_KeyPress_8.gml"));
QueueGMLFile(Path.Combine(dataPath3, "gml_Object_mb_cont_mobile_Step_0.gml"));

var MbContMobile = Data.GameObjects.ByName("mb_cont_mobile");
MbContMobile.Persistent = true;

var obj_world = Data.GameObjects.ByName("world");
if (obj_world is not null)
{
    bool addmobilecont = true;
    if (addmobilecont)
    {
        importGroup.QueueAppend(Data.Code.ByName("gml_Object_world_Create_0"),
                               "instance_create_depth(0, 0, 0, mb_cont_mobile);");
        importGroup.Import();
    }
}
else
{
    bool addObject = true;
    if (addObject)
    {
        var firstRoom = Data.Rooms[0];

        firstRoom.GameObjects.Add(new UndertaleRoom.GameObject()
        {
            InstanceID = Data.GeneralInfo.LastObj++,
            ObjectDefinition = MbContMobile,
            X = 0,
            Y = 0
        });
    }
}

importGroup.Import();

ScriptMessage("移动端脚本成功运行！\n感谢您的支持！");

void QueueGMLFile(string path)
{
    importGroup.QueueReplace(Path.GetFileNameWithoutExtension(path), File.ReadAllText(path));
}
