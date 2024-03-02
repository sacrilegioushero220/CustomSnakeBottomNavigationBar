part of 'api_bloc.dart';

sealed class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

final class ApiInitialState extends ApiState {}

final class ApisuccessState extends ApiState {}
