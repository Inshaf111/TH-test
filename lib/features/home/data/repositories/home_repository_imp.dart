import 'package:dukkantek/core/contants/string_contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dukkantek/features/home/data/data_sources/local_home_data_source.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_data_source.dart';
import '../models/user_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;
  final LocalHomeDataSource localHomeDataSource;

  HomeRepositoryImpl(
      {required this.homeDataSource, required this.localHomeDataSource});

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final id = await localHomeDataSource.getId();
      final user = await homeDataSource.getUser(id);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
