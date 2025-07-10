import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class RegisterPage extends HookWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final agreed = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/telead.svg', height: 80),
              const SizedBox(height: 16),
              const Text("Getting Started.!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Create an account to continue your allCourses."),
              const SizedBox(height: 32),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: agreed.value,
                    onChanged: (v) => agreed.value = v ?? false,
                  ),
                  const Text("Agree to Terms & Conditions"),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (agreed.value) {
                  
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              const Text("Or Continue With"),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/google.svg', height: 36),
                  const SizedBox(width: 16),
                  Image.asset('assets/images/apple.svg', height: 36),
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
    );
  }
}
