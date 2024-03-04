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

class ContactUsFetchEvent extends ApiEvent {}

class SearchVideosEvent extends ApiEvent {
  final String keyword;

  const SearchVideosEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class CategoryVideosFetchEvent extends ApiEvent {
  final String categoryId;

  const CategoryVideosFetchEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}
