import 'package:flutter/material.dart';

import 'color_pallete.dart';

abstract class ThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    useMaterial3: true,
    primaryColor: ColorPallete.primary,
    scaffoldBackgroundColor: ColorPallete.scaffoldBackground,
  );

  static ThemeData getDarkTheme() => ThemeData(
    useMaterial3: true,
    primaryColor: ColorPallete.primary,
    scaffoldBackgroundColor: ColorPallete.scaffoldDarkBackground,
  );
}
