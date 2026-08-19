using System;
using System.Windows;

namespace GameMaker_Mobiler
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private readonly Uri _lightThemeUri = new("Styles/LightTheme.xaml", UriKind.Relative);
        private readonly Uri _darkThemeUri = new("Styles/DarkTheme.xaml", UriKind.Relative);

        public bool IsDarkTheme { get; private set; }

        public void ApplyTheme(bool useDarkTheme)
        {
            var targetUri = useDarkTheme ? _darkThemeUri : _lightThemeUri;
            IsDarkTheme = useDarkTheme;

            if (Resources.MergedDictionaries.Count == 0)
            {
                Resources.MergedDictionaries.Add(new ResourceDictionary { Source = targetUri });
                return;
            }

            Resources.MergedDictionaries[0] = new ResourceDictionary { Source = targetUri };
        }
    }

}
