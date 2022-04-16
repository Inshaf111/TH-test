import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../dependancy_container.dart';
import '../../features/login/data/models/login_model.dart';
import 'app_config.dart';

//setting headers and interceptors
class DioClient {
  late Dio dio;
  DioClient() {
    _setup();
  }

  String getToken() {
    // locator<SharedPreferences>().clear();
    String res = locator<SharedPreferences>().getString("token") ?? "";
    if (res != "") {
      var decodedRes = LoginModel.fromJson(json.decode(res));
      return "Bearer " + decodedRes.token;
    } else {
      return "";
    }
  }

  _setup() async {
    dio = Dio(BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      baseUrl: apiBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10000,
      receiveTimeout: 30000,
    ));
    setupToken();
  }

  void setupToken() {
    String res = locator<SharedPreferences>().getString("token") ?? "";
    if (res != "") {
      var decodedRes = LoginModel.fromJson(json.decode(res));
      dio.options.headers["Authorization"] = "bearer " + decodedRes.token;
    }
  }
}
