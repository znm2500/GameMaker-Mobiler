using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
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
                    ? "✓ UTE 模板游戏（将自动执行修复脚本）"
                    : "✗ 非 UTE 模板游戏";
                UteStatusTextBlock.Foreground = isUte
                    ? (Brush)Application.Current.FindResource("SuccessBrush")
                    : (Brush)Application.Current.FindResource("TextMutedBrush");
            });

            if (version.IsValid)
            {
                AddLog($"版本检测成功：{version.DisplayVersion} (Major={version.Major}, Minor={version.Minor}, Release={version.Release}, Build={version.Build}, Bytecode={version.BytecodeVersion})");
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

            if (string.IsNullOrWhiteSpace(appName))
            {
                AddLog("错误：应用名称不能为空。", true);
                return;
            }

            if (!Regex.IsMatch(packageName, @"^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$"))
            {
                AddLog("错误：包名格式无效，例如 com.example.mygame。", true);
                MessageBox.Show(this,
                    "包名格式无效。\n\n请使用类似 com.example.mygame 的格式。",
                    "配置错误",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
                return;
            }

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
                    StartPortingButton.IsEnabled = true;
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
