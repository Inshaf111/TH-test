import 'package:dukkantek/core/contants/string_contants.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/local_login_data_source.dart';
import '../data_sources/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;
  final LocalLoginDataSource localLoginDataSource;

  LoginRepositoryImpl(
      {required this.loginDataSource, required this.localLoginDataSource});

  @override
  Future<Either<Failure, LoginUserEntity>> login(
      String email, String password) async {
    try {
      final _user = await loginDataSource.login(email, password);
      localLoginDataSource.saveToken(_user);
      return Right(_user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, LoginUserEntity>> signUp(
      String email, String password, String name) async {
    try {
      final _user = await loginDataSource.signUp(email, password, email);
      //had to call the login again as mock api  allows to authenticate  first login after registration only
      final _res = await loginDataSource.login(email, password);
      localLoginDataSource.saveToken(_res);

      return Right(_res);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
