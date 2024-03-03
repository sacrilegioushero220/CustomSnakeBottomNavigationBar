part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class ApiInitialEvent extends ApiEvent {}

class PopularVideosFetchEvent extends ApiEvent {}

class CategoryListFetchEvent extends ApiEvent {}

class AboutUsFetchEvent extends ApiEvent {}
