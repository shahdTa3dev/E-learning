import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: isDark ? AppColors.black : AppColors.navyBlue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: SvgPicture.asset(
                  'assets/images/splash.svg',
                  height: size.height * 0.4,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Telead',
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.white : AppColors.lightGray,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Learn from home',
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: isDark ? AppColors.lightBlueGray : AppColors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
