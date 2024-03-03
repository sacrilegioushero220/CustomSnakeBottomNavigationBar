part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class ApiInitialEvent extends ApiEvent {}

class ApiPopularVideosFetchEvent extends ApiEvent {}

class ApiCategoryListFetchEvent extends ApiEvent {}
