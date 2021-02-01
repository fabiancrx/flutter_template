
enum ThemeSetting { dark, light }

abstract class ThemeDataSource {
  ThemeSetting loadThemeSetting();

  Future<void> saveThemeSetting(ThemeSetting theme);
}
