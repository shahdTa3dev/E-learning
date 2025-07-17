import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/onboarding/model/intro_item_data.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';

import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/theme_toggle_icon_button.dart';

@RoutePage()
class IntroductionScreen extends HookWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final pageController = usePageController();
    final currentIndex = useState(0); 
    final l10n = AppLocalizations.of(context)!;

    final List<IntroItemData> pages = [
      IntroItemData(
        title: l10n.introTitle1,
        description: l10n.introDesc1,
        imagePath: "assets/images/online.svg",
      ),
      IntroItemData(
        title: l10n.introTitle2,
        description: l10n.introDesc2,
        imagePath: "assets/images/anytimlearn.svg",
      ),
      IntroItemData(
        title: l10n.introTitle3,
        description: l10n.introDesc3,
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: Spacing.medium),
          child: ThemeToggleIconButton(),
        ),
        actions: currentIndex.value != pages.length - 1
            ? [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Spacing.small),
                  child: TextButton(
                    onPressed: onFinish,
                    child: Text(
                      l10n.skip,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ]
            : [],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              onPageChanged: (index) => currentIndex.value = index,
              itemBuilder: (context, index) => _OnboardingPage(
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
                      text: l10n.getStarted,
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

class _OnboardingPage extends StatelessWidget {
  final IntroItemData data;

  const _OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
