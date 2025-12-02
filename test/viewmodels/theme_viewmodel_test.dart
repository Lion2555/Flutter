import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_app/viewmodels/theme_viewmodel.dart';

void main() {
  group('ThemeViewModel Tests', () {
    late ThemeViewModel viewModel;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('Initial theme should be light (false)', () async {
      viewModel = ThemeViewModel();

      await Future.delayed(Duration.zero);

      expect(viewModel.isDarkMode, false);
      expect(viewModel.currentThemeMode, ThemeMode.light);
    });

    test('toggleTheme should change theme and save it', () async {
      viewModel = ThemeViewModel();
      await Future.delayed(Duration.zero);

      await viewModel.toggleTheme();

      expect(viewModel.isDarkMode, true);
      expect(viewModel.currentThemeMode, ThemeMode.dark);

      await viewModel.toggleTheme();

      expect(viewModel.isDarkMode, false);
      expect(viewModel.currentThemeMode, ThemeMode.light);
    });

    test('Should load saved theme from SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({'isDarkMode': true});

      viewModel = ThemeViewModel();

      await Future.delayed(const Duration(milliseconds: 50));

      expect(viewModel.isDarkMode, true);
      expect(viewModel.currentThemeMode, ThemeMode.dark);
    });
  });
}