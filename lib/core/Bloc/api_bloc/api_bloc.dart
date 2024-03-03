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
  }

  FutureOr<void> apiPopularVideosFetchEvent(
      PopularVideosFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());

    try {
      // Fetch popular videos from the API
      final List<Video> popularVideos = await apiService.fetchPopularVideos();
      // Emit success state with the fetched videos

      emit(ApiSuccessState(video: popularVideos));
    } catch (e, stackTrace) {
      // Emit error state if an exception occurs
      emit(ApiErrorState());
      print("error is $e  and the stack trace is:$stackTrace");
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
      print(e);
    }
  }

  FutureOr<void> aboutUsFetchEvent(
      AboutUsFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch AboutUs List from the API
      final List<AboutUs> aboutUs = await apiService.fetchAboutUs();
      // Emit success state with the fetched videos
      print("aboutUs: $aboutUs");
      emit(AboutUsSuccessState(aboutUs: aboutUs));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> contactUsFetchEvent(
      ContactUsFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      // Fetch ContactUs List from the API
      final ContactUs contactUs = await apiService.fetchContactUs();
      // Emit success state with the fetched videos
      print("contactUs: $contactUs");
      emit(ContactUsSuccessState(contactUs: contactUs));
    } catch (e) {
      print(e);
    }
  }
}
