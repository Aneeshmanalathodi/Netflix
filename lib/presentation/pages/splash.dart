import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () => context.go('/login'));

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "NETFLIX",
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
