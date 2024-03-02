import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeevan_diabetes_app/core/Bloc/bloc_observer.dart';
import 'main_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}
