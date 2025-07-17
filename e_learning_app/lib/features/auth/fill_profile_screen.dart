import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';

import '../../../../core/constants/spacing.dart';
import '../../../features/router/app_router.dart';
import '../../../core/widgets/primary_button.dart';

@RoutePage()
class FillProfilePage extends HookWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final fullName = useTextEditingController();
    final nickName = useTextEditingController();
    final dob = useTextEditingController();
    final email = useTextEditingController();
    final phone = useTextEditingController();
    final gender = useState<String?>(null);
    final selectedImage = useState<File?>(null);

    final colorScheme = Theme.of(context).colorScheme;

    Future<void> pickImage() async {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        selectedImage.value = File(picked.path);
      }
    }

    Future<void> pickDate() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
      );
      if (pickedDate != null) {
        dob.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.fill_profile),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: Column(
            children: [
              const SizedBox(height: Spacing.large),

              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: selectedImage.value != null
                        ? FileImage(selectedImage.value!)
                        : null,
                    child: selectedImage.value == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                  InkWell(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: colorScheme.primary,
                      child: const Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.large),

              TextFormField(
                controller: fullName,
                decoration: InputDecoration(
                  hintText: l10n.full_name,
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              TextFormField(
                controller: nickName,
                decoration: InputDecoration(
                  hintText: l10n.nick_name,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: dob,
                    decoration: InputDecoration(
                      hintText: l10n.dob,
                      prefixIcon: const Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: l10n.email,
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '724-848-1225',
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 10),
                      Icon(Icons.flag),
                      SizedBox(width: 6),
                      Text("(+1)"),
                      SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              DropdownButtonFormField<String>(
                value: gender.value,
                decoration: InputDecoration(
                  hintText: l10n.gender,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                items: [
                  DropdownMenuItem(value: 'male', child: Text(l10n.male)),
                  DropdownMenuItem(value: 'female', child: Text(l10n.female)),
                ],
                onChanged: (value) => gender.value = value,
              ),
              const SizedBox(height: Spacing.large),

              PrimaryButton(
                text: l10n.continueLabel,
                onPressed: () {
                  context.router.replaceAll([const HomeRoute()]);
                },
              ),
              const SizedBox(height: Spacing.medium),

              TextButton(
                onPressed: () => context.router.replaceAll([const HomeRoute()]),
                child: Text(
                  l10n.skip_for_now,
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
              const SizedBox(height: Spacing.large),
            ],
          ),
        ),
      ),
    );
  }
}
