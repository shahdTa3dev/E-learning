import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.royalBlue,
    scaffoldBackgroundColor: AppColors.white,

    colorScheme: ColorScheme.light(
      primary: AppColors.royalBlue,
      secondary: AppColors.mustard,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      surface: AppColors.tealGreen,
    ),


    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.deepPurple,
    scaffoldBackgroundColor: AppColors.black,
  );
}
