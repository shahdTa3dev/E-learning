import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/spacing.dart';
import '../../../features/router/app_router.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/input_field.dart';

@RoutePage()
class FillProfilePage extends HookWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullName = useTextEditingController();
    final nickName = useTextEditingController();
    final dob = useTextEditingController();
    final email = useTextEditingController();
    final phone = useTextEditingController();
    final gender = useState<String?>(null);
    final selectedImage = useState<File?>(null);

    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
        title: const Text('Fill Your Profile'),
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

              
              InputField(
                controller: fullName,
                prefixIcon: Icons.person,
                hintText: 'Full Name',
              ),
              
              const SizedBox(height: Spacing.medium),

              InputField(
                controller: nickName,
                prefixIcon: Icons.person_outline,
                hintText: 'Nick Name',
              ),
              const SizedBox(height: Spacing.medium),

              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(
                  child: InputField(
                    controller: dob,
                    prefixIcon: Icons.date_range,
                    hintText: 'Date of Birth',
                  ),
                ),
              ),
              const SizedBox(height: Spacing.medium),

    
              InputField(
                controller: email,
                prefixIcon: Icons.email,
                hintText: 'Email',
              ),
              const SizedBox(height: Spacing.medium),

              TextField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 10),
                      Icon(Icons.flag),
                      SizedBox(width: 6),
                      Text("(+1)"), // هاي بعدين لازم تصير لسته 
                      SizedBox(width: 6),
                    ],
                  ),
                  hintText: '724-848-1225',
                  filled: true,
                  fillColor: colorScheme.onPrimary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: colorScheme.onPrimary),
              ),
              const SizedBox(height: Spacing.medium),

           
              DropdownButtonFormField<String>(
                value: gender.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  hintText: 'Gender',
                  filled: true,
                  fillColor: colorScheme.onPrimary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),



                items: const [
                  DropdownMenuItem(value: 'male', child: Text('Male')),
                  DropdownMenuItem(value: 'female', child: Text('Female')),
                ],
                onChanged: (value) => gender.value = value,
              ),
              const SizedBox(height: Spacing.large),

             
              PrimaryButton(
                text: 'Continue',
                onPressed: () {
                  context.router.replaceAll([const HomeRoute()]);
                },
              ),
              const SizedBox(height: Spacing.medium),

            
              TextButton(
                onPressed: () => context.router.replaceAll([const HomeRoute()]),
                child: Text(
                  'Skip for now',
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
