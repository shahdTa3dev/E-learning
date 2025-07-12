import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../features/router/app_router.dart';



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
      backgroundColor: AppColors.white,
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
                  TextField(
                    controller: fullName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
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
                  ElevatedButton.icon(
                    onPressed: () {
                      context.router.push(const RegisterRoute());
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("Continue"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    ),
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
