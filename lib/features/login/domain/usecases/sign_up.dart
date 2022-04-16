import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';
import 'login.dart';

class SignUp implements UseCase<LoginUserEntity, LoginParams> {
  final LoginRepository repository;

  SignUp(this.repository);

  @override
  Future<Either<Failure, LoginUserEntity>> call(LoginParams params) async {
    return await repository.signUp(params.email, params.password, params.email);
  }
}
