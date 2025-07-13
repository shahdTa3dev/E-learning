import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/spacing.dart';
import '../../core/theme/app_colors.dart';

class ContinueWithSection extends StatelessWidget {
  const ContinueWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Or Continue With",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: Spacing.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon('assets/images/google.svg'),
            const SizedBox(width: Spacing.medium),
            _buildSocialIcon('assets/images/apple.svg'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.lightGray, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(1, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: SvgPicture.asset(assetPath, height: 24, width: 24),
    );
  }
}
