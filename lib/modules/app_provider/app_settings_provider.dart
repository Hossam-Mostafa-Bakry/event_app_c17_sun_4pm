import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }

  // 1- language [ar, en]
  // 2- theme mode [light, dark]
}
