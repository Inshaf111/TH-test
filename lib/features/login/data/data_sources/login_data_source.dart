import 'package:dukkantek/core/config/dio_config.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/error/failures.dart';
import '../models/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> login(String email, String password);
  Future<LoginModel> signUp(String email, String password, String name);
}

class LoginDataSourceImpl extends DioClient implements LoginDataSource {
  LoginDataSourceImpl();

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await dio.post('/authaccount/login', data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        //as per the mock api returns 200 status code for wrong credintials
        if (response.data["message"].toString().toLowerCase() == "success") {
          return LoginModel.fromJson(response.data["data"]);
        } else {
          throw Unautherized();
        }
      } else {
        throw Failure.handleStatusCode(response.statusCode ?? 0);
      }
    } on Failure catch (_) {
      rethrow;
    }
  }

  @override
  Future<LoginModel> signUp(String email, String password, String name) async {
    try {
      final response = await dio.post('/authaccount/registration', data: {
        "name": name,
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        if (response.data["message"].toString().toLowerCase() != "success") {
          // i had to add this condition as the mock api doesnt give different status codes for some errors
          throw UserAlreadyExsist();
        } else {
          return LoginModel.fromJson(response.data["data"]);
        }
      } else {
        throw Failure.handleStatusCode(response.statusCode ?? 0);
      }
    } on Failure catch (_) {
      rethrow;
    }
  }
}
