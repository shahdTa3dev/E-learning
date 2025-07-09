import 'package:e_learning_app/core/theme/app_theme.dart';
import 'package:e_learning_app/features/onboarding/smooth_page_indicator.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      title: 'Telead App',
      home:IntroductionScreen(),
    );
  }
}


