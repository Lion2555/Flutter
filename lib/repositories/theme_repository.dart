import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  static const _key = 'isDarkMode';

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }
}
