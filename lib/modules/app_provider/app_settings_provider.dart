import 'package:event_app_c17_sun_4pm/modules/layout/favorite/favorite_view.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/home/home_view.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/profile/profile_view.dart';
import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  List<Widget> get pages => [
    const HomeView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDark() => currentTheme == ThemeMode.dark;

  // 1- language [ar, en]
  // 2- theme mode [light, dark]
}
