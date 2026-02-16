import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "NETFLIX",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => context.go('/home'),
                  child: const Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
