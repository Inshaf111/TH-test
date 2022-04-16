import 'package:dukkantek/core/config/dio_config.dart';
import '../../../../core/error/failures.dart';
import '../models/user_model.dart';

abstract class HomeDataSource {
  Future<UserModel> getUser(id);
}

class HomeDataSourceImpl extends DioClient implements HomeDataSource {
  HomeDataSourceImpl();

  @override
  Future<UserModel> getUser(id) async {
    try {
      final _response = await dio.get('/users/$id');
      if (_response.statusCode == 200) {
        return UserModel.fromJson(_response.data);
      } else {
        throw Failure.handleStatusCode(_response.statusCode ?? 0);
      }
    } on Failure catch (_) {
      rethrow;
    }
  }
}
