import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserEntity>> getUser();
}
