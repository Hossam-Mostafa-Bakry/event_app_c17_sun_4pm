import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_pallete.dart';

abstract class ThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    useMaterial3: true,
    primaryColor: ColorPallete.primary,
    scaffoldBackgroundColor: ColorPallete.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: ColorPallete.primary,
      iconTheme: IconThemeData(color: ColorPallete.primary),
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF686868),
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFF686868),
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF686868),
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF686868),
      ),
    ),
  );

  static ThemeData getDarkTheme() => ThemeData(
    useMaterial3: true,
    primaryColor: ColorPallete.primaryDark,
    scaffoldBackgroundColor: ColorPallete.scaffoldDarkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: ColorPallete.primary,
      iconTheme: IconThemeData(color: ColorPallete.primary),
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorPallete.mainTextColor,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorPallete.mainTextColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorPallete.mainTextColor,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorPallete.mainTextColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorPallete.mainTextColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorPallete.primary,
      ),
    ),
  );
}
