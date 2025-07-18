import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/theme_toggle_icon_button.dart';

@RoutePage()
class RegisterPage extends HookWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final isPasswordVisible = useState(false);
    final agreed = useState(false);

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
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    tr.getting_started,
                    style: AppTextStyles.title.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: Spacing.small),

                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    tr.register_subtitle,
                    style: AppTextStyles.body.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: Spacing.xxLarge),

                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: tr.email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.large),

                TextFormField(
                  controller: password,
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: tr.password,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: colorScheme.onSurface,
                      ),
                      onPressed: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.small),

                Row(
                  children: [
                    Checkbox(
                      value: agreed.value,
                      onChanged: (v) => agreed.value = v ?? false,
                      side: BorderSide(color: colorScheme.primary, width: 2.0),
                      activeColor: colorScheme.primary,
                      shape: const CircleBorder(),
                      checkColor: colorScheme.onPrimary,
                    ),
                    Text(
                      tr.agree_terms,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.medium),

                PrimaryButton(
                  text: tr.sign_up,
                  onPressed: () {
                    if (agreed.value) {
                      // Handle registration logic here
                    }
                  },
                ),
                const SizedBox(height: Spacing.xxxLarge),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${tr.have_acount} ",
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    GestureDetector(
                      onTap: () => context.router.pop(),
                      child: Text(
                        tr.sign_in,
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
