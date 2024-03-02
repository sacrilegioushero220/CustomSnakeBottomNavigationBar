import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jeevan_diabetes_app/network/api_service.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;
  ApiBloc({
    required this.apiService,
  }) : super(ApiInitialFetchState()) {
    on<ApiInitialFetchEvent>(_apiInitialFetchEvent);
  }

  FutureOr<void> _apiInitialFetchEvent(
      ApiInitialFetchEvent event, Emitter<ApiState> emit) {}
}
