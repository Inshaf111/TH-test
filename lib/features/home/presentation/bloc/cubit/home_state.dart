part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final UserEntity? userData;

  HomeLoaded({this.userData});
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError({required this.errorMessage});
}
