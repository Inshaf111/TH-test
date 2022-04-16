import 'dart:convert';
import '../models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalLoginDataSource {
  Future saveToken(LoginModel loginModel);
  Future getToken();
}

class LocalLoginDataSourceImpl implements LocalLoginDataSource {
  final SharedPreferences sharedPreferences;

  LocalLoginDataSourceImpl({required this.sharedPreferences});
  @override
  Future getToken() async {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future saveToken(LoginModel data) async {
    sharedPreferences.setString("token", json.encode(data));
  }
}
