// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/presentation/screens.dart';
import 'package:jeevan_diabetes_app/network/api_service.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(apiService: ApiService()),
      child: const MaterialApp(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        home: SplashScreen(),
      ),
    );
  }
}
