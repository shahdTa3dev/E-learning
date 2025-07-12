import 'package:flutter/material.dart';
import '../constants/padding.dart';
import '../theme/app_colors.dart';


class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: theme.iconTheme.color),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor:AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal:PaddingSizes.small, vertical:PaddingSizes.xSmall),
      ),
    );
  }
}
