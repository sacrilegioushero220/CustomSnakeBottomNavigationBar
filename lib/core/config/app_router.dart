import 'package:flutter/material.dart';
import 'package:jeevan_diabetes_app/core/presentation/screens.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    splash: (context) => const SplashScreen(),

    // Add more routes here
  };
}
