import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/input_field.dart';

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


                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Getting Started.!",
                      style: AppTextStyles.title,
                    ),
                    ),

                    const SizedBox(height: Spacing.small),

                    Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create an account to continue your all Courses",
                      style: AppTextStyles.body,
                      textAlign: TextAlign.left,
                    ),
                    ),

                  const SizedBox(height: Spacing.large),

                  InputField(
                    controller: email,
                    hintText: 'Email',
                    prefixIcon: Icons.email_outlined,

                  ),

                  const SizedBox(height: Spacing.medium),

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
                        value: agreed.value,
                        onChanged: (v) => agreed.value = v ?? false,
                        side: BorderSide(color: AppColors.tealGreen, width: 2.0),
                        activeColor: AppColors.tealGreen,
                        shape: const CircleBorder(),
                        checkColor: Colors.white, 
                        ),
                      const Text("Agree to Terms & Conditions"),
                    ],
                  ),


                  const SizedBox(height: Spacing.medium),
                  PrimaryButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (agreed.value) {
                        // Handle sign up
                      }
                    }

                  ),
                  const SizedBox(height: Spacing.xLarge),
                  
                  const Text("Or Continue With"),
                  const SizedBox(height: Spacing.medium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      SvgPicture.asset('assets/images/google.svg', height: 36),
                      const SizedBox(width: Spacing.xLarge),
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
