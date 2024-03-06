import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/models.dart';
import 'package:jeevan_diabetes_app/network/api_service.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;
  ApiBloc({
    required this.apiService,
  }) : super(ApiInitialState()) {
    on<PopularVideosFetchEvent>(apiPopularVideosFetchEvent);
    on<CategoryListFetchEvent>(apiCategoryListFetchEvent);
    on<AboutUsFetchEvent>(aboutUsFetchEvent);
    on<ContactUsFetchEvent>(contactUsFetchEvent);
    on<SearchVideosEvent>(searchVideosEvent);
    on<CategoryVideosFetchEvent>(categoryVideosFetchEvent);
  }

  FutureOr<void> apiPopularVideosFetchEvent(
      PopularVideosFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());

    try {
      // Fetch popular videos from the API
      final List<Video> popularVideos = await apiService.fetchPopularVideos();
      // Emit success state with the fetched videos

      emit(ApiSuccessState(video: popularVideos));
    } catch (e) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
    }
  }

  FutureOr<void> apiCategoryListFetchEvent(
      CategoryListFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch Category List from the API
      final List<Category> categoryList = await apiService.fetchCategoryList();
      // Emit success state with the fetched videos

      emit(CategorySuccessState(category: categoryList));
    } catch (e) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
    }
  }

  FutureOr<void> aboutUsFetchEvent(
      AboutUsFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch AboutUs List from the API
      final List<AboutUs> aboutUs = await apiService.fetchAboutUs();
      // Emit success state with the fetched videos

      emit(AboutUsSuccessState(aboutUs: aboutUs));
    } catch (e) {
      emit(ApiErrorState());
    }
  }

  FutureOr<void> contactUsFetchEvent(
      ContactUsFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch ContactUs List from the API
      final ContactUs contactUs = await apiService.fetchContactUs();
      // Emit success state with the fetched videos

      emit(ContactUsSuccessState(contactUs: contactUs));
    } catch (e) {
      emit(ApiErrorState());
    }
  }

  FutureOr<void> searchVideosEvent(
      SearchVideosEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Call the method in ApiService to perform search
      final List<Video> searchResults =
          await apiService.searchVideos(event.keyword);
      // Emit success state with the search results
      emit(SearchVideosSuccessState(searchResults: searchResults));
    } catch (e) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
    }
  }

  FutureOr<void> categoryVideosFetchEvent(
      CategoryVideosFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch category videos from the API using categoryId
      final List<Video> categoryVideos =
          await apiService.fetchCategoryVideos(event.categoryId);

      // Emit success state with the fetched category videos
      emit(CategoryVideosSuccessState(categoryVideos: categoryVideos));
    } catch (e) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
    }
  }
}
