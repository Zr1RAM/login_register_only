import 'package:flutter/material.dart';
import 'package:login_register_only/views/home_screen.dart';
import 'package:login_register_only/views/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final bool isOnBoarded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login / Register',
      // theme: ThemeData(),
      home: isOnBoarded ? const HomeScreen() : const OnBoardingScreen(),
    );
  }
}

// UI inspiration you can draw from 
// https://cdn.dribbble.com/userupload/9567331/file/original-933ab16f0ef777ffff298ec1a226d5b5.mp4
