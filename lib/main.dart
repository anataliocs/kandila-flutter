import 'package:flutter/material.dart';
import 'package:kandila/theme/app_theme.dart';
import 'package:kandila/screens/login_screen.dart';
import 'package:kandila/screens/signup_screen.dart';
import 'package:kandila/screens/savings_screen.dart';
import 'package:kandila/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kandila Savings',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const SavingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
