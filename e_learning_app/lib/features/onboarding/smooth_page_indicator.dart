// Clean onboarding screen matching the provided design

import 'package:e_learning_app/features/auth/login_page.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/features/onboarding/intro_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<IntroItemData> _pages = const [
    IntroItemData(
      title: "Online Learning",
      description: "We Provide Classes Online Classes and Pre Recorded Lectures.!",
      imagePath: "assets/images/onlinelearning.svg",
    ),
    IntroItemData(
      title: "Learn from Anytime",
      description: "Booked or Same the Lectures for Future",
      imagePath: "assets/images/anytime.svg",
    ),
    IntroItemData(
      title: "Get Online Certificate",
      description: "Analyse your scores and Track your results",
      imagePath: "assets/images/certificate.svg",
    ),
  ];

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _onFinish();
    }
  }

  void _onFinish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _currentIndex != _pages.length - 1
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
                  child: TextButton(
                    onPressed: _onFinish,
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.navyBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _pages.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) => _BuildPage(_pages[index]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.large, vertical: Spacing.medium),
        child: Row(
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                type: WormType.thin,
                spacing: 8,
                dotColor: AppColors.lightBlueGray,
                activeDotColor: AppColors.navyBlue,
              ),
            ),
            const Spacer(),
            _currentIndex == _pages.length - 1
                ? ElevatedButton(
                    onPressed: _onFinish,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                      minimumSize: const Size(150, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Get Started", style: TextStyle(color: Colors.white)),
                        const SizedBox(width: Spacing.small),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(Icons.arrow_forward, size: 18, color: AppColors.navyBlue),
                        )
                      ],
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: FloatingActionButton(
                      onPressed: _onNext,
                      backgroundColor: AppColors.navyBlue,
                      elevation: 0,
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _BuildPage extends StatelessWidget {
  final IntroItemData data;
  const _BuildPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(
            data.imagePath,
            height: 200,
            placeholderBuilder: (context) => const CircularProgressIndicator(),
          ),
          const Spacer(),
          Text(
            data.title,
            style: AppTextStyles.title.copyWith(color: AppColors.onSurface),
          ),
          const SizedBox(height: Spacing.small),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(color: AppColors.onSurfaceVariant),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
