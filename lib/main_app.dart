import 'package:flutter/material.dart';
import 'package:jeevan_diabetes_app/core/presentation/screens.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
