import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/spacing.dart';
import '../../../features/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: Spacing.xLarge),

            // Avatar
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: colorScheme.primary.withOpacity(0.1),
                child: Icon(Icons.person, size: 50, color: colorScheme.primary),
              ),
            ),
            const SizedBox(height: Spacing.medium),

          
            Text(
              "Hello, Shahd 👋",
              style: AppTextStyles.title.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: Spacing.small),
            Text(
              "Welcome to your home screen!",
              style: AppTextStyles.body.copyWith(color: colorScheme.onSurfaceVariant),
            ),

            const SizedBox(height: Spacing.xLarge),

           
            ListTile(
              leading: Icon(Icons.person, color: colorScheme.primary),
              title: const Text("My Profile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.router.push(const FillProfileRoute());
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: colorScheme.primary),
              title: const Text("Settings"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
              
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.router.push(const IntroductionRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
