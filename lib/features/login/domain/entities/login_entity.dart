import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginUserEntity extends Equatable {
  final String email;
  final int id;
  final String token;

  const LoginUserEntity(
      {required this.email, required this.id, required this.token});

  @override
  List<Object> get props => [email, id, token];
}
