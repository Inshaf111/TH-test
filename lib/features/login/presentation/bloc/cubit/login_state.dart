part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  final bool isloading;
  final String errorMessage;
  final LoginUserEntity? loginuserData;
  LoginInitial({
    required this.loginuserData,
    required this.errorMessage,
    required this.isloading,
  });
}
