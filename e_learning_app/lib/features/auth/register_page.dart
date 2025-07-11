import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/theme/app_colors.dart';

@RoutePage()
class RegisterPage extends HookWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final agreed = useState(false);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.paleLavender,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height - MediaQuery.of(context).padding.top,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  SvgPicture.asset('assets/images/telead.svg', height: 80),
                  const SizedBox(height: Spacing.medium),
                  Text("Getting Started.!", style: AppTextStyles.title),
                  const SizedBox(height: Spacing.small),
                  Text(
                    "Create an account to continue your allCourses.",
                    style: AppTextStyles.body,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.large),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: Spacing.medium),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: Spacing.small),
                  Row(
                    children: [
                      Checkbox(
                        value: agreed.value,
                        onChanged: (v) => agreed.value = v ?? false,
                      ),
                      const Text("Agree to Terms & Conditions"),
                    ],
                  ),
                  const SizedBox(height: Spacing.medium),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (agreed.value) {
                        // Handle sign up
                      }
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  const SizedBox(height: Spacing.xLarge),
                  const Text("Or Continue With"),
                  const SizedBox(height: Spacing.medium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/google.svg', height: 36),
                      const SizedBox(width: Spacing.medium),
                      SvgPicture.asset('assets/images/apple.svg', height: 36),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.router.pop(),
                    child: const Text("Already have an account? SIGN IN"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
