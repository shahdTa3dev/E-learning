import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../features/router/app_router.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/input_field.dart';
import '../../../core/widgets/continue_with_section.dart';
import '../../../core/widgets/theme_toggle_icon_button.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final rememberMe = useState(false);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: Spacing.medium),
          child: ThemeToggleIconButton(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const SizedBox(height: Spacing.huge),

                SvgPicture.asset('assets/images/telead.svg', height: 80),
                const SizedBox(height: Spacing.xxxLarge),
              

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let’s Sign In.!",
                    style: AppTextStyles.title.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.small),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login to your account to continue your courses.",
                    style: AppTextStyles.body.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: Spacing.xxLarge),

                InputField(
                  controller:  email,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: Spacing.large),

                InputField(
                  controller: password,
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: Spacing.small),

                Row(
                  children: [
                    Checkbox(
                      value: rememberMe.value,
                      onChanged: (v) => rememberMe.value = v ?? false,
                      side: BorderSide(color: colorScheme.primary, width: 2.0),
                      activeColor: colorScheme.primary,
                      checkColor: colorScheme.onPrimary,
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: colorScheme.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.medium),

                PrimaryButton(
                  text: " Sign In",
                  onPressed: () {
                    context.router.push(const FillProfileRoute());
                  },
                ),

                const SizedBox(height: Spacing.xLarge),
                const ContinueWithSection(),

                const SizedBox(height: Spacing.xxxLarge),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    GestureDetector(
                      onTap: () =>
                          context.router.push(const RegisterRoute()),
                      child: Text(
                        "SIGN UP",
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.large),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
