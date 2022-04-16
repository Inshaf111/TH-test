import 'dart:convert';
import '../../../login/data/data_sources/local_login_data_source.dart';
import '../../../login/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalHomeDataSource {
  Future getId();
}

class LocalHomeDataSourceImpl implements LocalHomeDataSource {
  final SharedPreferences sharedPreferences;

  LocalHomeDataSourceImpl({required this.sharedPreferences});
  @override
  Future getId() async {
    String _res = sharedPreferences.getString("token") ?? "";
    if (_res != "") {
      final _decodedRes = LoginModel.fromJson(json.decode(_res));
      return _decodedRes.id;
    } else {
      return 0;
    }
  }
}
