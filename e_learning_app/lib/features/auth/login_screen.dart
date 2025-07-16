import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/theme_toggle_icon_button.dart';
import '../../../features/router/app_router.dart';

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
    final tr = AppLocalizations.of(context)!;

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
                    tr.sign_in,
                    style: AppTextStyles.title.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.small),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tr.login_subtitle,
                    style: AppTextStyles.body.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: Spacing.xxLarge),

                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: tr.email,
                    filled: true,
                    fillColor: colorScheme.onPrimary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.large),

                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: tr.password,
                    filled: true,
                    fillColor: colorScheme.onPrimary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
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
                      tr.remember_me,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        tr.forgot_password,
                        style: TextStyle(color: colorScheme.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.medium),

                PrimaryButton(
                  text: tr.sign_in,
                  onPressed: () {
                    context.router.push(const FillProfileRoute());
                  },
                ),
                const SizedBox(height: Spacing.xxxLarge),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${tr.skip} ",
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    GestureDetector(
                      onTap: () => context.router.push(const RegisterRoute()),
                      child: Text(
                        tr.sign_up,
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
