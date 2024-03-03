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

final class ApiCategorySuccessState extends ApiState {
  @override
  List<Object> get props => [category];
  final List<Category> category;

  const ApiCategorySuccessState({required this.category});
}
