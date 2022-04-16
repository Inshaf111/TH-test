import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginUserEntity>> login(String email, String password);
  Future<Either<Failure, LoginUserEntity>> signUp(
      String email, String password, String name);
}
