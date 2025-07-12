import 'package:flutter/material.dart';
import 'font_sizes.dart';
import '../theme/app_colors.dart';

final class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: AppFontSizes.xl,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppFontSizes.md,
    color: AppColors.onSurfaceVariant,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontSizes.base,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.base,
    color: AppColors.black,
  );
}
