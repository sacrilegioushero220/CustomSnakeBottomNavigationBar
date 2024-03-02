part of 'api_bloc.dart';

sealed class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

final class ApiInitialState extends ApiState {}

final class ApiLoadingState extends ApiState {}

final class ApiSuccessState extends ApiState {
  final List<Video> fetchedData;

  const ApiSuccessState({required this.fetchedData});
}

final class ApiErrorState extends ApiState {}
