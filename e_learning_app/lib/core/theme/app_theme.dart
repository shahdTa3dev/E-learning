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
    colorScheme: const ColorScheme.light(
      primary: AppColors.brightBlue,
      secondary: AppColors.mustard,
      surface: AppColors.white,
      surfaceContainer: AppColors.lightBlueGray,
      error: Colors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      onSurface: AppColors.onSurface,
      onError: AppColors.white,

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
    colorScheme: const ColorScheme.dark(
      primary: AppColors.deepPurple,
      secondary: AppColors.mustard,
      surface: Color(0xFF1E1E2C),
      background: Color(0xFF121212),
      error: Colors.redAccent,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      onBackground: AppColors.white,
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
