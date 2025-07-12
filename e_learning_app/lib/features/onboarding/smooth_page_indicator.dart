import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/onboarding/model/intro_item_data.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/notifiers/theme_notifier.dart';
import '../../../core/widgets/primary_button.dart';

@RoutePage()
class IntroductionScreen extends HookWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final pageController = usePageController();
    final currentIndex = useState(0);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    final List<IntroItemData> pages = const [
      IntroItemData(
        title: "Online Learning",
        description:
            "We Provide Online Classes and Pre-Recorded Lectures!",
        imagePath: "assets/images/online.svg",
      ),
      IntroItemData(
        title: "Learn Anytime",
        description: "Book or Save Lectures for Future Reference",
        imagePath: "assets/images/anytimlearn.svg",
      ),
      IntroItemData(
        title: "Get Certified",
        description: "Analyse your scores and Track your results",
        imagePath: "assets/images/getcertificate.svg",
      ),
    ];

    void onFinish() {
      context.router.replace(const LoginRoute());
    }

    void onNext() {
      if (currentIndex.value < pages.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        onFinish();
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: currentIndex.value != pages.length - 1
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  icon: Icon(
                    themeNotifier.isDark
                        ? Icons.wb_sunny_outlined
                        : Icons.nightlight_round,
                    color: colorScheme.primary,
                  ),
                  onPressed: () => themeNotifier.toggleTheme(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Spacing.small),
                  child: TextButton(
                    onPressed: onFinish,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: colorScheme.primary,
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
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              onPageChanged: (index) => currentIndex.value = index,
              itemBuilder: (context, index) => _BuildPage(
                data: pages[index],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: Spacing.large,
          right: Spacing.large,
          top: Spacing.medium,
          bottom: Spacing.xxxxLarge,
        ),
        child: Row(
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: pages.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                type: WormType.thin,
                spacing: 8,
                dotColor: colorScheme.surfaceContainer,
                activeDotColor: colorScheme.primary,
              ),
            ),
            const Spacer(),
            currentIndex.value == pages.length - 1
                ? Expanded(
                    child: PrimaryButton(
                      text: "Get Started",
                      onPressed: onFinish,
                    ),
                  )
                : FloatingActionButton(
                    onPressed: onNext,
                    backgroundColor: colorScheme.primary,
                    elevation: 0,
                    child:
                        Icon(Icons.arrow_forward, color: colorScheme.onPrimary),
                  ),
          ],
        ),
      ),
    );
  }
}

class _BuildPage extends StatelessWidget {
  final IntroItemData data;

  const _BuildPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              data.imagePath,
              height: screenHeight * 0.28,
              fit: BoxFit.contain,
              placeholderBuilder: (context) =>
                  const CircularProgressIndicator(),
            ),
            const SizedBox(height: Spacing.xxLarge),
            Text(
              data.title,
              style: AppTextStyles.title.copyWith(
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.small),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
