# GameMaker-Mobiler

一个用于将 GameMaker Studio（GMS1 / GMS2）Windows 游戏一键移植到 Android 平台的 WPF 桌面工具。

## ✨ 功能特性

- **一键移植**：拖拽或选择 `data.win`，自动完成版本检测 → data 修改 → APK 构建 → 对齐 → 签名全流程
- **智能版本识别**：内置启发式解析器（对齐 UndertaleModLib）+ UTMT 完整 Reader 双重策略，精确识别 GMS 1.x / 2.x / 2022~2024 全系列版本
- **APK 模板库**：内置从 GMS2 `2.0.6` 到 `2024.14` 共 19 套官方运行时 APK 模板，按版本自动匹配（精确匹配 > 向上兼容 > 向下兼容 > 全局最新）
- **Mobile 集成脚本**：注入触控按键、F2 全屏、治疗按钮、中文优化、安卓系统键盘等移动端适配补丁
- **UTE 模板自动修复**：识别基于 Undertale Engine（UTE / GMU）模板的游戏，自动执行控制台与路径修复脚本
- **资源注入**：自动打包游戏全部资源（data / locale / bin / assets 目录）到 APK assets 区
- **自定义应用信息**：支持自定义应用名称、包名、版本号、应用图标（PNG）、启动画面（PNG）
- **深浅色主题**：内置浅色/深色两套 UI 主题，一键切换
- **实时日志与进度**：可视化移植进度 + 详细日志输出，支持随时取消

## 🛠️ 技术栈

- **框架**：.NET 8 + WPF (`net8.0-windows`)
- **语言**：C# 12（nullable enabled, implicit usings, record 类型）
- **核心依赖**：
  - [UndertaleModTool CLI (UTMT)](https://github.com/krzys-h/UndertaleModTool) —— data.win 读写与脚本注入
  - [Apktool](https://apktool.org/) v3.0.3 —— APK 解包/重打包
  - [apksigner](https://developer.android.com/studio/command-line/apksigner) —— APK 签名
  - 便携 JRE（内置 `jre-portable`）—— 无需系统安装 Java
  - `Microsoft.Xaml.Behaviors.Wpf` —— WPF 交互行为

## 📦 构建与运行

### 系统要求
- Windows 10 及以上
- .NET 8 SDK（用于构建）
- 运行时无需额外安装 Java（内置便携 JRE）

### 构建步骤
```bash
# 克隆仓库
git clone <repo-url>
cd GameMaker-Mobiler

# 还原并构建
dotnet restore GameMaker-Mobiler.sln
dotnet build GameMaker-Mobiler.sln -c Release

# 运行
cd GameMaker-Mobiler/bin/Release/net8.0-windows
./GameMaker-Mobiler.exe
```

> **注意**：运行前请确保仓库根目录存在以下目录结构（`Tools/` 与 `GMS2 APK/` 为运行时依赖，构建不会自动复制）：
> ```
> GameMaker-Mobiler/
> ├── Tools/
> │   ├── UTMT_CLI_v0.9.1.2-Windows/      # UndertaleModCli 及其依赖
> │   ├── 移植脚本/                        # Mobile 集成 + UTE 修复脚本集
> │   ├── apktool_3.0.3.jar
> │   ├── apksigner.jar
> │   └── jre-portable/                   # 便携 JRE
> └── GMS2 APK/                           # 各版本 APK 模板（共 19 个 .apk 文件）
> ```

## 🚀 使用指南

### 基础流程

1. **选择数据源**
   - 点击「浏览 data.win」按钮选择文件，或直接将 `data.win` / 游戏目录拖拽到虚线区域
   - 工具会自动：
     - 定位 `data.win` 并读取版本信息
     - 检测是否为 UTE 模板游戏（判断依据：`bin/` + `locale/` + `gmu_console.dll` 同时存在）
     - 显示完整版本信息（原始 GEN8 版本、特征 chunk 下限、结构级下限）

2. **填写应用信息**
   | 字段 | 说明 | 示例 |
   |------|------|------|
   | 应用名称 | APK 展示名称 | `MyGame` |
   | 包名 | Android 包名，需符合 Java 包命名规范 | `com.example.mygame` |
   | 版本号 | `versionName`，任意字符串 | `1.0.0` |
   | 应用图标 | 可选，PNG 格式，留空用模板默认 | `icon.png` |
   | 加载图片 | 可选，PNG 格式，留空用模板默认 | `splash.png` |

3. **配置 Mobile 选项**
   - 勾选「启用 Mobile 集成」解锁以下子选项：
     - **F2 全屏模式** (`mobile_f2`)：注入 F2 切换全屏的按键映射
     - **治疗按钮** (`mobile_heal`)：移动端屏幕上添加治疗按钮
     - **中文优化** (`mobile_cn`)：启用中文环境下的渲染与输入优化
     - **安卓系统键盘** (`Android_System_Keyboard`)：使用系统 IME 替代内置键盘

4. **开始移植**
   - 点击「开始移植」，选择 APK 输出路径
   - 进度条与日志窗口实时显示状态，可随时点击「取消」中止
   - 移植成功后弹窗提示 APK 保存位置

### 版本检测说明

版本检测采用「双重验证 + 三层下限」策略：

1. **优先 UTMT 完整 Reader**：调用 `UndertaleModCli.exe` 加载 data 文件，输出 `Data.GeneralInfo.*`，这是最准确的结果
2. **回退内置启发式**（UTMT 不可用时）：
   - 读取 `GEN8` chunk 原始版本号 + BytecodeVersion
   - 应用 **chunk 名下限**（UILR→2024.13、PSEM→2023.2、FEAT→2022.8 等）
   - 应用 **结构级下限**：
     - SOND chunk 布局 → 2024.6（UndertaleSound entry 间隙 40 字节）
     - AGRP chunk 新增 AudioGroupPathPtr → 2024.14

### APK 模板匹配规则

`GMS2 APK/` 目录内共 19 套模板（`2.0.6` ~ `2024.14`），按以下优先级匹配：

1. **精确匹配**：Major + Minor 完全一致，取最高 Revision
2. **向上兼容**：同 Major 取 ≥ 游戏版本的最低模板（推荐）
3. **向下兼容**：同 Major 所有模板 < 游戏版本，取最高模板
4. **全局最新**：无同 Major 模板时，使用全局最新模板

## 📁 项目结构

```
GameMaker-Mobiler/
├── GameMaker-Mobiler/                # WPF 主项目
│   ├── Services/
│   │   ├── DataWinVersionReader.cs   # data.win 版本解析（核心）
│   │   ├── UtmtService.cs            # UTMT CLI 封装：Mobile 集成 + UTE 修复
│   │   ├── ApkBuilder.cs             # APK 构建管线（解包→注入→重打包→对齐→签名）
│   │   └── GameInfo.cs               # 游戏上下文记录
│   ├── Styles/
│   │   ├── DarkTheme.xaml            # 深色主题资源字典
│   │   └── LightTheme.xaml           # 浅色主题资源字典
│   ├── MainWindow.xaml(.cs)          # 主窗口 UI + 交互逻辑
│   ├── App.xaml(.cs)                 # 应用入口 + 主题切换
│   ├── LogEntry.cs                   # 日志条目模型
│   └── GameMaker-Mobiler.csproj
├── GMS2 APK/                         # 各版本 GameMaker Android 运行时模板
│   ├── 2.0.6.apk  2.2.2.apk  2.3.0.apk ... 2024.14.apk
│   └── （共 19 个模板）
├── Tools/
│   ├── UTMT_CLI_v0.9.1.2-Windows/    # UndertaleModTool CLI 发行版
│   ├── 移植脚本/
│   │   ├── 安卓脚本v2.0/
│   │   │   ├── Mobile集成脚本.csx     # 注入 Mobile 控件对象与全局变量
│   │   │   └── MobileScript/          # GML 源：触控按键/全屏/控制对象
│   │   └── Ute 修复脚本/
│   │       ├── Ute控制台和路径修复.csx        # GMS ≥2.3.0 的 UTE 修复
│   │       └── 低于GMS 2.3.0的脚本/          # GMS <2.3.0 的旧版修复
│   ├── apktool_3.0.3.jar             # APK 解包/重打包工具
│   ├── apksigner.jar                 # APK 签名工具
│   └── jre-portable/                 # 便携 JRE（Java 运行时）
├── GameMaker-Mobiler.sln             # Visual Studio 解决方案
└── NuGet.config
```

## 🧩 核心模块

### DataWinVersionReader
`DataWinVersionReader.Read(path)` → `DataWinVersion` record

| 字段 | 说明 |
|------|------|
| Major / Minor / Release / Build | 四层版本号 |
| BytecodeVersion | GMS 字节码版本（14~17 常见） |
| IsGameMaker2 | `Major >= 2` |
| DisplayVersion | 格式化展示字符串，如 `GMS2 2024.14 (bytecode 17)` |
| RawGen8Version | GEN8 chunk 读取的原始版本号 |
| ChunkNameFloor | 命中的特征 chunk 下限规则，如 `UILR→2024.13` |
| StructuralFloor | 命中的结构级下限，如 `SOND→2024.6` |

### ApkBuilder 管线

```
BuildApkAsync()
  ├─ 10%  FindTemplateApk()          按版本匹配 APK 模板
  ├─ 20%  BuildWithApktoolAsync()
  │       ├─ Apktool d  解包模板 APK
  │       ├─ PatchDecodedManifest()  替换包名/版本/名称
  │       ├─ PatchDecodedSmali()     smali 目录重命名 + 字符串替换
  │       ├─ 复制 game.droid 到 assets/
  │       ├─ CopyGameResources()     复制 locale/bin/data/assets
  │       │   └─ (UTE) StripLocalePrefixes() / RemoveGmuConsoleDll()
  │       └─ Apktool b  重新构建未签名 APK
  ├─ 50%  ReplaceApkIcon()           替换 mipmap 图标
  ├─ 55%  ReplaceApkSplashScreen()   替换启动画面
  ├─ 60%  ZipAlignApkAsync()         ZIP 对齐
  ├─ 70%  SignApkAsync()             apksigner v2/v3 签名
  └─ 90%  复制到最终输出路径
```

**底层二进制补丁能力**（Apktool 路径不可用时的后备方案）：
- `PatchAndroidManifest()` —— 二进制 AXML 解析与包名/版本号补丁
- `PatchResourceTablePackageName()` —— resources.arsc TableType 包名替换
- `PatchDexPackageNames()` —— DEX string_id / string_data 重映射，重算 Adler32 + SHA1 校验和

### UtmtService 脚本执行

`ModifyDataWin(dataWinPath, options[5], outputFileName, ct)` 按顺序执行：

1. **Mobile 集成脚本**（`add_mobilekey=true` 时）：`Mobile集成脚本.csx` 注入触控对象
2. **UTE 修复脚本**（检测到 UTE 时自动执行）：
   - GMS ≥ 2.3.0 → `Ute控制台和路径修复.csx`（`Lang_LoadString` 等脚本改为相对路径，移除控制台宏）
   - GMS < 2.3.0 → `旧版Ute控制台和路径修复.csx`
3. **写入全局变量**：通过 `replace` 命令覆盖 `gml_Object_mb_cont_mobile_Create_0`，写入 5 个开关值

## 📱 支持的 GameMaker 版本

| 版本系列 | 状态 | 对应模板 |
|----------|------|----------|
| GMS 1.x | ✅ 基础支持（字节码 14~16） | 用 GMS2 模板兼容运行 |
| GMS 2.0.x | ✅ | `2.0.6.apk` |
| GMS 2.2.x | ✅ | `2.2.2.apk` |
| GMS 2.3.x | ✅ | `2.3.0.apk` / `2.3.2.apk` / `2.3.7.apk` |
| GMS 2022.x | ✅ | `2022.1` ~ `2022.12` 共 5 套 |
| GMS 2023.x | ✅ | `2023.2` / `2023.4` / `2023.6` / `2023.11` |
| GMS 2024.x | ✅（含 SOND 2024.6 / AGRP 2024.14 结构检测） | `2024.8` / `2024.11` / `2024.13` / `2024.14` |

## ⚠️ 常见问题

**Q: 提示「未找到任何 APK 模板文件」**
A: 检查仓库根目录 `GMS2 APK/` 是否包含 `.apk` 文件，且生成的 `.exe` 相对路径 `../../../../GMS2 APK/` 可解析到该目录。

**Q: 提示「UndertaleModCli.exe not found」**
A: 确认 `Tools/UTMT_CLI_v0.9.1.2-Windows/UndertaleModCli.exe` 存在。`Tools/` 目录需与构建输出目录保持相对层级一致。

**Q: 移植后 APK 闪退**
A: 常见原因：
1. 版本模板严重不匹配（GMS1 用过高模板）—— 查看日志确认「使用模板」行
2. 包名含非法字符 —— 必须匹配 `^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$`
3. 自定义图标/启动画面尺寸异常 —— 建议先用默认资源验证

**Q: UTE 游戏启动后报路径错误**
A: 确认日志中出现「执行 UTE 修复脚本」，且应用状态栏显示「✓ UTE 模板游戏」。若仍有问题，手动检查 `locale/*/string.txt` 是否去掉了 `./` 前缀。

## 📄 License

本项目集成了多个第三方工具，使用时请遵循其各自许可证：
- UndertaleModTool：[LICENSE.txt](Tools/UTMT_CLI_v0.9.1.2-Windows/LICENSE.txt)
- Apktool：Apache 2.0
- JRE：[GPLv2 with Classpath Exception](Tools/jre-portable/NOTICE)
- GameMaker 运行时 APK 模板版权归 YoYo Games / Opera 所有
