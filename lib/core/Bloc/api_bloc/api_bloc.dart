import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/video_model/video.dart';

import 'package:jeevan_diabetes_app/network/api_service.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;
  ApiBloc({
    required this.apiService,
  }) : super(ApiInitialState()) {
    on<ApiPopularVideosFetchEvent>(apiPopularVideosFetchEvent);
  }

  FutureOr<void> apiPopularVideosFetchEvent(
      ApiPopularVideosFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());

    try {
      // Fetch popular videos from the API
      final List<Video> popularVideos = await apiService.fetchPopularVideos();
      // Emit success state with the fetched videos
      print("popularVideos: $popularVideos");
      emit(ApiSuccessState(fetchedData: popularVideos));
    } catch (e, stackTrace) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
      print("error is $e  and the stack trace is:$stackTrace");
    }
  }
}
