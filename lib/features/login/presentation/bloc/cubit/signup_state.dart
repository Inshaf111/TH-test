part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {
  final bool isloading;
  final String errorMessage;
  final LoginUserEntity? loginuserData;
  SignupInitial({
    required this.loginuserData,
    required this.errorMessage,
    required this.isloading,
  });
}
