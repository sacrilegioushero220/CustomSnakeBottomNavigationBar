import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/category_model/category.dart';
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
    on<ApiCategoryListFetchEvent>(apiCategoryListFetchEvent);
  }

  FutureOr<void> apiPopularVideosFetchEvent(
      ApiPopularVideosFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());

    try {
      // Fetch popular videos from the API
      final List<Video> popularVideos = await apiService.fetchPopularVideos();
      // Emit success state with the fetched videos
      print("popularVideos: $popularVideos");
      emit(ApiSuccessState(video: popularVideos));
    } catch (e, stackTrace) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
      print("error is $e  and the stack trace is:$stackTrace");
    }
  }

  FutureOr<void> apiCategoryListFetchEvent(
      ApiCategoryListFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch Category List from the API
      final List<Category> categoryList = await apiService.fetchCategoryList();
      // Emit success state with the fetched videos
      print("categorList: $categoryList");
      emit(ApiCategorySuccessState(category: categoryList));
    } catch (e) {
      print(e);
    }
  }
}
