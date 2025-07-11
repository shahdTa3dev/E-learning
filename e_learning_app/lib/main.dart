import 'package:e_learning_app/core/theme/app_theme.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      title: 'Telead App',
    );
  }
}


