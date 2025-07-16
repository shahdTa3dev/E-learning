import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../constants/font_sizes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.brightBlue,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.black,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBlueGray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      hintStyle: const TextStyle(color: AppColors.onSurfaceVariant),
      prefixIconColor: AppColors.navyBlue,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.brightBlue,
      secondary: AppColors.tealGreen,
      surface: AppColors.lavender,
      surfaceContainer: AppColors.lightBlueGray,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      onSurface: AppColors.onSurface,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppFontSizes.xxl,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      titleLarge: TextStyle(
        fontSize: AppFontSizes.xl,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: AppFontSizes.md,
        color: AppColors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: AppFontSizes.base,
        color: AppColors.onSurfaceVariant,
      ),
      labelLarge: TextStyle(
        fontSize: AppFontSizes.base,
        color: AppColors.navyBlue,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.navyBlue,
      foregroundColor: AppColors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.deepPurple,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A40),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIconColor: AppColors.mustard,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.deepPurple,
      secondary: AppColors.tealGreen,
      surface: Color(0xFF1E1E2C),
      error: Colors.redAccent,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      onError: Colors.black,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppFontSizes.xxl,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: AppFontSizes.xl,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: AppFontSizes.md,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: AppFontSizes.base,
        color: Colors.grey,
      ),
      labelLarge: TextStyle(
        fontSize: AppFontSizes.base,
        color: AppColors.mustard,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mustard,
      foregroundColor: AppColors.black,
    ),
  );
}
