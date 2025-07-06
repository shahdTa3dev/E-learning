import 'package:e_learning_app/login_page.dart';
import 'intro_item_data.dart';
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
      description: "We Provide Classes Online Classes and Pre Recorded Leactures.!",
      imagePath: "assets/images/onlinelearning.svg",
    ),
    IntroItemData(
      title: "Learn from Anytime",
      description: "Booked or Same the Lectures for Future",
      imagePath: "assets/images/exams.svg",
    ),
    IntroItemData(
      title: "Get Online Certificate",
      description: "Analyse your scores and Track your results",
      imagePath: "assets/images/certificate.svg",
    ),
  ];

  void _skip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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

  Widget buildImage(String path) {
    return SvgPicture.asset(
      path,
      height: 250,
      fit: BoxFit.contain,
      placeholderBuilder: (context) => const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: _skip,
          child: const Text("Skip"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildImage(_pages[index].imagePath),
                      const SizedBox(height: 24),
                      Text(
                        _pages[index].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _pages[index].description,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _onNext,
                child: Text(
                  _currentIndex == _pages.length - 1 ? "Finish" : "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
