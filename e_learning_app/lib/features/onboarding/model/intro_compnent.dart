import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../onboarding/model/intro_item_data.dart';
import '/core/constants/spacing.dart';
import '/core/constants/padding.dart';
import '/core/constants/font_sizes.dart';



class IntroItemWidget extends StatelessWidget {
  final IntroItemData data;

  const IntroItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data.imagePath, height: 250),

        const SizedBox(height:Spacing.xLarge),
        
        Text(
          data.title,
          style: const TextStyle(
            fontSize:AppFontSizes.xl,
            fontWeight: FontWeight.bold
            ),
        ),
        const SizedBox(height: Spacing.large),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:PaddingSizes.medium),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize:AppFontSizes.lg, color:AppColors.onSurfaceVariant),
          ),
        ),
      ],
    );
  }
}
