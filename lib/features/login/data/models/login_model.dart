import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginUserEntity {
  const LoginModel(
      {required String email, required int id, required String token})
      : super(email: email, id: id, token: token);

  fromJson(Map<String, dynamic> json) {}

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['Email'],
      id: json['Id'],
      token: json['Token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Id'] = id;
    data['Token'] = token;

    return data;
  }
}
