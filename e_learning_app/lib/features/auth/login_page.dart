import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../features/router/app_router.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/input_field.dart';
import '../../../core/widgets/continue_with_section.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final rememberMe = useState(false);
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
                      "Let’s Sign In.!",
                      style: AppTextStyles.title,
                    ),
                    ),

                    const SizedBox(height: Spacing.small),

                    Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login to your account to continue your courses.",
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
                
                  Row(
                    children: [
                        Checkbox(
                        value: rememberMe.value,
                        onChanged: (v) => rememberMe.value = v ?? false,
                        side: BorderSide(color: AppColors.tealGreen, width: 2.0),
                        activeColor: AppColors.tealGreen, 
                        checkColor: Colors.white, 
                        ),
                        
                      const Text("Remember Me"),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?"),
                      ),
                    ],
                  ),


                  const SizedBox(height: Spacing.medium),


                  PrimaryButton(
                    text: " Sign In",
                    onPressed: () {
                      // Handle login logic here
                      context.router.push(const FillProfileRoute());
                    },
                  ),

                  const SizedBox(height: Spacing.xLarge),

                  const ContinueWithSection(),

                 const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account? "),
                        GestureDetector(
                          onTap: () => context.router.push(const RegisterRoute()),
                          child: Text(
                            "SIGN UP",
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.navyBlue,
                              decoration: TextDecoration.underline,
                            ),
                          )

                  ),

                 
                ],
              ),
                ],
              ),  
          ),
        ),
      ),
      )
    );
  }    
}
