import 'package:flutter/material.dart';
import '../constants/spacing.dart';
import '../theme/app_colors.dart';
import '../constants/padding.dart';
import '../constants/font_sizes.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height:Spacing.xxxxLarge,
        decoration: BoxDecoration(
          color:AppColors.brightBlue,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(1, 2),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal:PaddingSizes.xxSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color:AppColors.white,
                  fontWeight: FontWeight.bold, 
                  fontSize: AppFontSizes.sm,
                  height: 2.2,
                ),
              ),
            ),
            const SizedBox(width:Spacing.medium),

            Container(
              height:Spacing.xxLarge,
              width: Spacing.xxLarge,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color:AppColors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_forward, 
              color: AppColors.brightBlue, 
              size:AppFontSizes.xl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
