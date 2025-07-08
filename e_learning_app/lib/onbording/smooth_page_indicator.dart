import 'package:e_learning_app/login_page.dart';
import 'intro_item_data.dart';
import "../theme/app_colors.dart";
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
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
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
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => _BuildPage(_pages[index]),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: AppColors.lightBlueGray,
                    activeDotColor: AppColors.navyBlue,
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _currentIndex == _pages.length - 1
                      ? Semantics(
                          label: 'getStartedButton',
                          child: ElevatedButton.icon(
                            onPressed: _onFinish,
                            icon: const Icon(Icons.arrow_forward, color: Colors.white),
                            label: const Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.navyBlue,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: Semantics(
                            label: 'nextButton',
                            child: FloatingActionButton(
                              onPressed: _onNext,
                              backgroundColor: AppColors.navyBlue,
                              child: const Icon(Icons.arrow_forward, color: Colors.white),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 32),
              ],
            ),
            Positioned(
              top: 10,
              right: 20,
              child: TextButton(
                onPressed: _onNext,
                child: Text(
                  _currentIndex == _pages.length - 1 ? "Finish" : "Next",
                  style: TextStyle(color: Colors.black),
                ),
               ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildPage extends StatelessWidget {
  const _BuildPage(this.data);
  final IntroItemData data;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700, 
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
