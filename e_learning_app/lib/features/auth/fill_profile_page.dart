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


@RoutePage()
class FillProfilePage extends HookWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullName = useTextEditingController();
    final phone = useTextEditingController();
    final location = useTextEditingController();
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
                  Text("Complete Profile", style: AppTextStyles.title),
                  const SizedBox(height: Spacing.small),
                  Text(
                    "Fill your details to personalize your experience.",
                    style: AppTextStyles.body,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.large),

                  InputField(
                    controller: fullName,
                    prefixIcon: Icons.person,
                    hintText: 'Full Name',
                  ),

                  const SizedBox(height: Spacing.medium),

                  InputField(
                    controller:fullName,
                    prefixIcon: Icons.person, 
                    hintText: 'Nick Name',
                  ),

                  const SizedBox(height: Spacing.medium),

                  InputField(
                    controller: fullName,
                    prefixIcon: Icons.date_range,
                    hintText: 'Date of Birth',
                  ),
                  const SizedBox(height: Spacing.medium),

                  InputField(
                    controller: fullName,
                    prefixIcon: Icons.email_outlined,
                    hintText: 'Education',
                  ),
                  const SizedBox(height: Spacing.medium),

                  TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: Spacing.medium),


                  TextField(
                    controller: location,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: Spacing.large),
                  PrimaryButton(
                    text: "Continue",
                    onPressed: () {
                      context.router.push(const RegisterRoute());
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.router.push(const RegisterRoute()),
                    child: const Text("Skip for now"),
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
