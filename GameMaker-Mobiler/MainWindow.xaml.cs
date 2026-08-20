using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Animation;
using System.Windows.Media;
using System.Text.RegularExpressions;
using GameMaker_Mobiler.Services;
using Microsoft.Win32;

namespace GameMaker_Mobiler
{
    public partial class MainWindow : Window
    {
        private bool _useDarkTheme;
        private readonly Brush _sourceDropOriginalBorderBrush;
        private readonly UtmtService _utmtService;
        private readonly ApkBuilder _apkBuilder;
        private GameInfo? _currentGameInfo;
        private CancellationTokenSource? _portingCts;
        private string? _selectedIconPath;
        private string? _selectedSplashPath;
        private string? _lastOutputDir;

        public ObservableCollection<string> Logs { get; } = [];

        public MainWindow()
        {
            InitializeComponent();
            DataContext = this;

            _sourceDropOriginalBorderBrush = SourceDropBorder.BorderBrush;
            _utmtService = new UtmtService(AddLog);
            _apkBuilder = new ApkBuilder(AddLog);

            SubOptionsContainer.IsHitTestVisible = false;
            SubOptionsContainer.Visibility = Visibility.Collapsed;

            Logs.CollectionChanged += OnLogsCollectionChanged;
            Logs.Add("应用启动完成。当前主题：浅色。");
            Logs.Add("请选择或拖拽 data.win 开始移植。");

            UpdateStartPortingAvailability();
        }

        private void ThemeToggleButton_Click(object sender, RoutedEventArgs e)
        {
            _useDarkTheme = !_useDarkTheme;

            if (Application.Current is App app)
            {
                app.ApplyTheme(_useDarkTheme);
            }

            var themeBackground = (System.Windows.Media.Brush)Application.Current.FindResource("WindowBackgroundBrush");
            Background = themeBackground;
            RootLayout.Background = themeBackground;

            ThemeToggleButton.Content = _useDarkTheme ? "切换浅色" : "切换深色";
            Logs.Add(_useDarkTheme ? "主题已切换为深色。" : "主题已切换为浅色。");
        }

        private void OnLogsCollectionChanged(object? sender, NotifyCollectionChangedEventArgs e)
        {
            if (Logs.Count == 0)
            {
                return;
            }

            Dispatcher.InvokeAsync(() => LogListBox.ScrollIntoView(Logs[^1]));
        }

        private async void BrowseDataWinButton_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog
            {
                Title = "选择 data.win",
                Filter = "GameMaker 数据文件 (data.win)|data.win|所有文件|*.*",
                CheckFileExists = true,
                Multiselect = false
            };

            if (dialog.ShowDialog() == true)
            {
                await HandleDataSourceSelectionAsync(dialog.FileName).ConfigureAwait(false);
            }
        }

        private void SourceDropBorder_DragEnter(object sender, DragEventArgs e)
        {
            UpdateDragVisual(e, true);
        }

        private void SourceDropBorder_DragOver(object sender, DragEventArgs e)
        {
            UpdateDragVisual(e, false);
        }

        private void SourceDropBorder_DragLeave(object sender, DragEventArgs e)
        {
            SourceDropBorder.BorderBrush = _sourceDropOriginalBorderBrush;
            SourceDropBorder.BorderThickness = new Thickness(1);
        }

        private async void SourceDropBorder_Drop(object sender, DragEventArgs e)
        {
            SourceDropBorder.BorderBrush = _sourceDropOriginalBorderBrush;
            SourceDropBorder.BorderThickness = new Thickness(1);

            if (!TryGetDroppedPath(e, out var droppedPath) || string.IsNullOrWhiteSpace(droppedPath))
            {
                AddLog("错误：未识别到有效拖拽路径。", true);
                return;
            }

            await HandleDataSourceSelectionAsync(droppedPath).ConfigureAwait(false);
        }

        private void UpdateDragVisual(DragEventArgs e, bool setBorderThickness)
        {
            if (TryGetDroppedPath(e, out _))
            {
                e.Effects = DragDropEffects.Copy;
                SourceDropBorder.BorderBrush = (Brush)Application.Current.FindResource("PrimaryBrush");

                if (setBorderThickness)
                {
                    SourceDropBorder.BorderThickness = new Thickness(2);
                }

                return;
            }

            e.Effects = DragDropEffects.None;
            SourceDropBorder.BorderBrush = _sourceDropOriginalBorderBrush;
            SourceDropBorder.BorderThickness = new Thickness(1);
        }

        private static bool TryGetDroppedPath(DragEventArgs e, out string? path)
        {
            path = null;

            if (!e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                return false;
            }

            if (e.Data.GetData(DataFormats.FileDrop) is not string[] items || items.Length == 0)
            {
                return false;
            }

            path = items[0];
            return true;
        }

        private async Task HandleDataSourceSelectionAsync(string selectedPath)
        {
            var dataWinPath = ResolveDataWinPath(selectedPath);
            if (string.IsNullOrWhiteSpace(dataWinPath))
            {
                await Dispatcher.InvokeAsync(() =>
                {
                    GameVersionTextBlock.Text = "版本：检测失败";
                    DataWinPathTextBlock.Text = "data.win 路径：未检测";
                });

                AddLog("错误：所选路径不包含 data.win。", true);
                return;
            }

            var sourceDirectory = Path.GetDirectoryName(dataWinPath) ?? string.Empty;
            _currentGameInfo = new GameInfo(sourceDirectory, dataWinPath, DataWinVersionReader.Invalid, false);

            await Dispatcher.InvokeAsync(() =>
            {
                SourcePathTextBox.Text = sourceDirectory;
                DataWinPathTextBlock.Text = $"data.win 路径：{dataWinPath}";
                GameVersionTextBlock.Text = "版本：检测中...";
                StartPortingButton.IsEnabled = false;
                StatusTextBlock.Text = "检测 data.win...";
            });

            AddLog($"已选择目录：{sourceDirectory}");

            var version = await Task.Run(() => DataWinVersionReader.Read(dataWinPath)).ConfigureAwait(false);
            var isUte = DetectUteTemplate(sourceDirectory);
            _currentGameInfo = _currentGameInfo with { Version = version, IsUteTemplate = isUte };

            await Dispatcher.InvokeAsync(() =>
            {
                GameVersionTextBlock.Text = version.IsValid
                    ? $"版本：{version.DisplayVersion}"
                    : "版本：未知";

                UteStatusTextBlock.Text = isUte
                    ? "✓ 旧 UTE 模板游戏（将自动执行修复脚本）"
                    : "✗ 非旧 UTE 模板游戏";
                UteStatusTextBlock.Foreground = isUte
                    ? (Brush)Application.Current.FindResource("SuccessBrush")
                    : (Brush)Application.Current.FindResource("TextMutedBrush");

                UpdateStartPortingAvailability();
            });

            if (version.IsValid)
            {
                AddLog($"版本检测成功：{version.DisplayVersion} (Major={version.Major}, Minor={version.Minor}, Release={version.Release}, Build={version.Build}, Bytecode={version.BytecodeVersion})");
                AddLog(version.IsYyc
                    ? "  · 编译方式：YYC（不支持植入脚本，开始移植已禁用）"
                    : "  · 编译方式：VM");
                AddLog($"  · 原始 GEN8 版本：{version.RawGen8Version}");
                AddLog($"  · 特征 chunk 下限：{version.ChunkNameFloor}");
                AddLog($"  · 结构级下限：{version.StructuralFloor}");
                AddLog(isUte ? "  · UTE 模板：是（可执行修复脚本）" : "  · UTE 模板：否（仅 Mobile 集成可用）");
            }
            else
            {
                AddLog("版本检测失败：未能识别 data.win 对应的 GMS 版本。", true);
            }
        }

        private static readonly Regex PackageNameRegex = new(
            @"^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$",
            RegexOptions.Compiled | RegexOptions.CultureInvariant);

        /// <summary>
        /// 前端对应用名称做字符限制：禁止单引号、双引号、XML 特殊字符与控制字符。
        /// 这些字符会导致 aapt2 编译 strings.xml 失败（例如 "unescaped apostrophe"）。
        /// </summary>
        private static readonly Regex AppNameAllowedRegex = new(
            @"^[^'\""<>&\x00-\x1F\x7F]{1,64}$",
            RegexOptions.Compiled | RegexOptions.CultureInvariant);

        private static readonly char[] VersionInvalidChars = new[]
        {
            '<', '>', ':', '"', '/', '\\', '|', '?', '*'
        };

        private (bool AppNameValid, bool PackageValid, bool VersionValid, string Status) _apkInputValidation;

        private void ApkInput_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (StartPortingButton is null)
            {
                return;
            }

            ValidateApkInputs();
            UpdateStartPortingAvailability();
        }

        /// <summary>
        /// 校验「应用名称 / 包名 / 版本号」三项前端输入。
        /// 通过提示文字变红 / 变灰实时提示。
        /// </summary>
        private void ValidateApkInputs()
        {
            if (AppNameHintTextBlock is null || PackageNameHintTextBlock is null || VersionHintTextBlock is null)
            {
                return;
            }

            var validBrush = (Brush)FindResource("TextMutedBrush");
            var errorBrush = (Brush?)TryFindResource("ErrorBrush") ?? Brushes.IndianRed;

            string status;

            // 1) 应用名称
            var appName = AppNameTextBox.Text;
            bool appNameValid;
            if (string.IsNullOrWhiteSpace(appName))
            {
                appNameValid = false;
                AppNameHintTextBlock.Text = "应用名称不能为空。";
            }
            else if (!AppNameAllowedRegex.IsMatch(appName))
            {
                appNameValid = false;
                AppNameHintTextBlock.Text =
                    "非法字符：禁止包含 ' (单引号)、\" (双引号)、< > & 以及控制字符；长度 1~64。";
            }
            else
            {
                appNameValid = true;
                AppNameHintTextBlock.Text =
                    "合法字符：中英文、数字、空格、下划线、连字符。禁止 ' 、\" 、< 、> 、&。";
            }
          
            AppNameHintTextBlock.Foreground = appNameValid ? validBrush : errorBrush;
            ToolTipService.SetToolTip(AppNameTextBox, appNameValid ? null : AppNameHintTextBlock.Text);

            // 2) 包名
            var packageName = PackageNameTextBox.Text.Trim();
            bool packageValid;
            if (string.IsNullOrWhiteSpace(packageName))
            {
                packageValid = false;
                PackageNameHintTextBlock.Text = "包名不能为空。";
            }
            else if (!PackageNameRegex.IsMatch(packageName))
            {
                packageValid = false;
                PackageNameHintTextBlock.Text =
                    "格式错误：字母开头，仅字母 / 数字 / 下划线，用 . 分段且至少两段。例：com.example.mygame";
            }
            else
            {
                packageValid = true;
                PackageNameHintTextBlock.Text =
                    "格式：字母开头，仅字母 / 数字 / 下划线，以 . 分段，至少两段。例：com.example.mygame";
            }
            PackageNameHintTextBlock.Foreground = packageValid ? validBrush : errorBrush;
            ToolTipService.SetToolTip(PackageNameTextBox, packageValid ? null : PackageNameHintTextBlock.Text);

            // 3) 版本号
            var version = VersionTextBox.Text.Trim();
            bool versionValid;
            if (string.IsNullOrWhiteSpace(version))
            {
                versionValid = false;
                VersionHintTextBlock.Text = "版本号不能为空。";
            }
            else if (version.Length > 64)
            {
                versionValid = false;
                VersionHintTextBlock.Text = "版本号过长（请≤64个字符）。";
            }
            else if (version.Any(c => char.IsControl(c) || VersionInvalidChars.Contains(c)))
            {
                versionValid = false;
                VersionHintTextBlock.Text = "非法字符：禁止控制字符与路径符号 < > : \" / \\ | ? *。";
            }
            else
            {
                versionValid = true;
                VersionHintTextBlock.Text =
                    "显示版本（versionName），任意字符串，建议 x.y.z。禁止控制字符与路径非法符号。";
            }
            VersionHintTextBlock.Foreground = versionValid ? validBrush : errorBrush;
            ToolTipService.SetToolTip(VersionTextBox, versionValid ? null : VersionHintTextBlock.Text);

            if (!appNameValid) status = "应用名称不合法";
            else if (!packageValid) status = "包名格式错误";
            else if (!versionValid) status = "版本号不合法";
            else status = "就绪";

            _apkInputValidation = (appNameValid, packageValid, versionValid, status);
        }

        private void UpdateStartPortingAvailability()
        {
            ValidateApkInputs();

            if (_currentGameInfo is null)
            {
                StartPortingButton.IsEnabled = false;
                StatusTextBlock.Text = "就绪";
                return;
            }

            if (!_currentGameInfo.Version.IsValid)
            {
                StartPortingButton.IsEnabled = false;
                StatusTextBlock.Text = "版本未知，无法移植";
                return;
            }

            if (_currentGameInfo.Version.IsYyc)
            {
                StartPortingButton.IsEnabled = false;
                StatusTextBlock.Text = "YYC 编译，无法移植";
                return;
            }

            if (!_apkInputValidation.AppNameValid ||
                !_apkInputValidation.PackageValid ||
                !_apkInputValidation.VersionValid)
            {
                StartPortingButton.IsEnabled = false;
                StatusTextBlock.Text = _apkInputValidation.Status;
                return;
            }

            StartPortingButton.IsEnabled = true;
            StatusTextBlock.Text = "就绪";
        }

        private static string? ResolveDataWinPath(string selectedPath)
        {
            if (File.Exists(selectedPath) &&
                string.Equals(Path.GetFileName(selectedPath), "data.win", StringComparison.OrdinalIgnoreCase))
            {
                return selectedPath;
            }

            if (!Directory.Exists(selectedPath))
            {
                return null;
            }

            var candidate = Path.Combine(selectedPath, "data.win");
            return File.Exists(candidate) ? candidate : null;
        }

        private void AddMobileKeyCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            AnimateSubOptions(expand: true);
        }

        private void AddMobileKeyCheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            AnimateSubOptions(expand: false);
        }

        private void AnimateSubOptions(bool expand)
        {
            var targetHeight = expand ? 150d : 0d;
            var targetOpacity = expand ? 1d : 0d;

            if (expand)
            {
                SubOptionsContainer.Visibility = Visibility.Visible;
                SubOptionsContainer.IsHitTestVisible = true;
            }

            var duration = TimeSpan.FromMilliseconds(220);
            var heightAnimation = new DoubleAnimation(targetHeight, duration)
            {
                EasingFunction = new QuadraticEase { EasingMode = EasingMode.EaseOut }
            };

            var opacityAnimation = new DoubleAnimation(targetOpacity, duration)
            {
                EasingFunction = new QuadraticEase { EasingMode = EasingMode.EaseOut }
            };

            if (!expand)
            {
                opacityAnimation.Completed += (_, _) =>
                {
                    SubOptionsContainer.IsHitTestVisible = false;
                    SubOptionsContainer.Visibility = Visibility.Collapsed;
                };
            }

            SubOptionsContainer.BeginAnimation(HeightProperty, heightAnimation);
            SubOptionsContainer.BeginAnimation(OpacityProperty, opacityAnimation);
        }

        private void AddLog(string message, bool isError = false)
        {
            var prefix = isError ? "[Error]" : "[Info]";
            var line = $"{DateTime.Now:HH:mm:ss} {prefix} {message}";

            _ = Dispatcher.InvokeAsync(() => Logs.Add(line));
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

        private void BrowseIconButton_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog
            {
                Title = "选择应用图标",
                Filter = "PNG 图片 (*.png)|*.png|所有文件|*.*",
                CheckFileExists = true
            };

            if (dialog.ShowDialog() == true)
            {
                _selectedIconPath = dialog.FileName;
                IconPathTextBox.Text = dialog.FileName;
                var fi = new FileInfo(dialog.FileName);
                IconPreviewTextBlock.Text = $"大小: {fi.Length / 1024} KB";
            }
        }

        private void BrowseSplashButton_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog
            {
                Title = "选择加载图片",
                Filter = "PNG 图片 (*.png)|*.png|所有文件|*.*",
                CheckFileExists = true
            };

            if (dialog.ShowDialog() == true)
            {
                _selectedSplashPath = dialog.FileName;
                SplashPathTextBox.Text = dialog.FileName;
                var fi = new FileInfo(dialog.FileName);
                SplashPreviewTextBlock.Text = $"大小: {fi.Length / 1024} KB";
            }
        }

        private async void StartPortingButton_Click(object sender, RoutedEventArgs e)
        {
            if (_currentGameInfo is null)
            {
                AddLog("错误：请先选择有效的 data.win。", true);
                return;
            }

            if (!_currentGameInfo.Version.IsValid)
            {
                AddLog("错误：版本尚未识别。", true);
                return;
            }

            if (_currentGameInfo.Version.IsYyc)
            {
                AddLog("错误：检测到 YYC 编译，当前脚本植入流程不支持移植。", true);
                return;
            }

            ValidateApkInputs();
            if (!_apkInputValidation.AppNameValid ||
                !_apkInputValidation.PackageValid ||
                !_apkInputValidation.VersionValid)
            {
                AddLog($"错误：{_apkInputValidation.Status}。请修正右侧 APK 打包设置中高亮的字段。", true);
                MessageBox.Show(this,
                    $"输入校验未通过：{_apkInputValidation.Status}\n\n"
                    + "请查看每个输入框下方的红色提示文字进行修正。",
                    "配置错误",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
                return;
            }

            var appName = AppNameTextBox.Text.Trim();
            var invalidChars = Path.GetInvalidFileNameChars();
            var safeAppName = invalidChars.Aggregate(appName, (c, ch) => c.Replace(ch, '_'));
            if (string.IsNullOrWhiteSpace(safeAppName)) safeAppName = "MyGame";

            var defaultFileName = safeAppName;

            var saveDialog = new SaveFileDialog
            {
                Title = "选择 APK 保存位置",
                Filter = "APK 文件 (*.apk)|*.apk",
                FileName = $"{defaultFileName}.apk",
                AddExtension = true,
                DefaultExt = ".apk",
                RestoreDirectory = true
            };

            if (saveDialog.ShowDialog() != true)
                return;

            var outputPath = saveDialog.FileName;
            var outputDir = Path.GetDirectoryName(outputPath) ?? string.Empty;
            var outputFileName = Path.GetFileNameWithoutExtension(outputPath);

            var options = new[]
            {
                AddMobileKeyCheckBox.IsChecked == true,
                MobileF2CheckBox.IsChecked == true,
                MobileHealCheckBox.IsChecked == true,
                MobileCnCheckBox.IsChecked == true,
                AndroidKeyboardCheckBox.IsChecked == true
            };

            var packageName = PackageNameTextBox.Text.Trim();
            var version = VersionTextBox.Text.Trim();

            StartPortingButton.IsEnabled = false;
            ResetButton.IsEnabled = false;
            CancelButton.IsEnabled = true;
            BuildProgressBar.Value = 0;
            ProgressTextBlock.Text = "0%";
            StatusTextBlock.Text = "移植中...";

            _portingCts?.Dispose();
            _portingCts = new CancellationTokenSource();

            var progress = new Progress<(int Percent, string Message)>(p =>
            {
                void ApplyProgress()
                {
                    BuildProgressBar.Value = Math.Clamp(p.Percent / 100d, 0d, 1d);
                    ProgressTextBlock.Text = $"{p.Percent}%";
                    StatusTextBlock.Text = p.Message;
                }

                if (Dispatcher.CheckAccess())
                {
                    ApplyProgress();
                }
                else
                {
                    _ = Dispatcher.InvokeAsync(ApplyProgress);
                }
            });

            string? modifiedDataWinPath = null;

            try
            {
                AddLog("===== 开始移植流程 =====");

                AddLog("步骤 1: 修改 data.win (UTMT CLI)...");
                modifiedDataWinPath = Path.Combine(
                    Path.GetTempPath(),
                    $"gmm_port_{Guid.NewGuid():N}.game.droid");
                await _utmtService
                    .ModifyDataWinToPath(
                        _currentGameInfo.DataWinPath,
                        options,
                        modifiedDataWinPath,
                        _portingCts.Token);
                AddLog("data.win 修改完成，已写入临时目录。");

                AddLog("步骤 2: 选择 APK 模板...");
                var templateApk = _apkBuilder.FindTemplateApk(_currentGameInfo.Version);
                AddLog($"使用模板: {Path.GetFileName(templateApk)}");

                AddLog("步骤 3-5: 构建 APK...");
                await _apkBuilder.BuildApkAsync(
                    templateApk,
                    _currentGameInfo.SourceDirectory,
                    modifiedDataWinPath,
                    outputPath,
                    appName,
                    packageName,
                    version,
                    _selectedIconPath,
                    _selectedSplashPath,
                    _currentGameInfo.IsUteTemplate,
                    progress,
                    _portingCts.Token);

                _lastOutputDir = outputDir;

                await Dispatcher.InvokeAsync(() =>
                {
                    StatusTextBlock.Text = "移植完成！";
                });

                AddLog("===== 移植成功！=====");
                await Dispatcher.InvokeAsync(() =>
                    MessageBox.Show(this,
                        $"移植成功！\n\nAPK 已保存到：\n{outputPath}",
                        "移植完成",
                        MessageBoxButton.OK,
                        MessageBoxImage.Information));
            }
            catch (OperationCanceledException)
            {
                AddLog("移植已取消。", true);
                await Dispatcher.InvokeAsync(() => StatusTextBlock.Text = "已取消");
            }
            catch (Exception ex)
            {
                AddLog($"移植失败：{ex.Message}", true);
                await Dispatcher.InvokeAsync(() => StatusTextBlock.Text = "移植失败");
                await Dispatcher.InvokeAsync(() =>
                    MessageBox.Show(this,
                        $"移植失败：\n{ex.Message}",
                        "错误",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error));
            }
            finally
            {
                try
                {
                    if (!string.IsNullOrEmpty(modifiedDataWinPath) &&
                        File.Exists(modifiedDataWinPath))
                    {
                        File.Delete(modifiedDataWinPath);
                    }
                }
                catch
                {
                    // Ignore temporary data cleanup errors.
                }

                await Dispatcher.InvokeAsync(() =>
                {
                    UpdateStartPortingAvailability();
                    ResetButton.IsEnabled = true;
                    CancelButton.IsEnabled = false;
                });
            }
        }

        private void ResetButton_Click(object sender, RoutedEventArgs e)
        {
            _currentGameInfo = null;
            _selectedIconPath = null;
            _selectedSplashPath = null;
            _lastOutputDir = null;

            SourcePathTextBox.Text = "未选择目录";
            DataWinPathTextBlock.Text = "data.win 路径：未检测";
            GameVersionTextBlock.Text = "版本：未检测";
            UteStatusTextBlock.Text = "UTE 模板状态：等待检测...";
            UteStatusTextBlock.Foreground = (Brush)FindResource("TextMutedBrush");
            StartPortingButton.IsEnabled = false;

            AppNameTextBox.Text = "MyGame";
            PackageNameTextBox.Text = "com.example.mygame";
            VersionTextBox.Text = "1.0.0";
            IconPathTextBox.Text = "未选择图标（使用默认）";
            IconPreviewTextBlock.Text = "";
            SplashPathTextBox.Text = "未选择加载图片（使用默认）";
            SplashPreviewTextBlock.Text = "";

            AddMobileKeyCheckBox.IsChecked = false;
            MobileF2CheckBox.IsChecked = true;
            MobileHealCheckBox.IsChecked = false;
            MobileCnCheckBox.IsChecked = true;
            AndroidKeyboardCheckBox.IsChecked = false;

            BuildProgressBar.Value = 0;
            ProgressTextBlock.Text = "0%";
            StatusTextBlock.Text = "就绪";

            Logs.Add("界面已重置。");
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            _portingCts?.Cancel();
            AddLog("正在取消移植...");
        }
    }
}
