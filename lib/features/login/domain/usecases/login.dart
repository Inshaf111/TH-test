import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUser implements UseCase<LoginUserEntity, LoginParams> {
  final LoginRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, LoginUserEntity>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
