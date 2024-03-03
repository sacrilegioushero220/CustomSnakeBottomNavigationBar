part of 'api_bloc.dart';

sealed class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

final class ApiInitialState extends ApiState {}

final class ApiLoadingState extends ApiState {}

final class ApiSuccessState extends ApiState {
  @override
  List<Object> get props => [video];
  final List<Video> video;

  const ApiSuccessState({required this.video});
}

final class ApiErrorState extends ApiState {}

final class CategorySuccessState extends ApiState {
  @override
  List<Object> get props => [category];
  final List<Category> category;

  const CategorySuccessState({required this.category});
}

final class AboutUsSuccessState extends ApiState {
  @override
  List<Object> get props => [aboutUs];
  final List<AboutUs> aboutUs;

  const AboutUsSuccessState({required this.aboutUs});
}

final class ContactUsSuccessState extends ApiState {
  @override
  List<Object> get props => [contactUs];
  final ContactUs contactUs;

  const ContactUsSuccessState({required this.contactUs});
}
