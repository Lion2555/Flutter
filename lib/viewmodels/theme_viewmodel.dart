import 'package:flutter/material.dart';
import '../repositories/theme_repository.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeRepository _repository = ThemeRepository();

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeViewModel() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    _isDarkMode = await _repository.loadTheme();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _repository.saveTheme(_isDarkMode);
    notifyListeners();
  }

  ThemeMode get currentThemeMode =>
      _isDarkMode ? ThemeMode.dark : ThemeMode.light;
}
