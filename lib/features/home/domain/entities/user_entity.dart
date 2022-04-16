import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserEntity extends Equatable {
  final String email;

  const UserEntity({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}
