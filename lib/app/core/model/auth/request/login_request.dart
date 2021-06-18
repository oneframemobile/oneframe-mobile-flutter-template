import 'package:networking/networking/serializable_object.dart';

class LoginRequest implements SerializableObject<LoginRequest> {
  String? userName;
  String? password;

  LoginRequest({this.userName, this.password});

  LoginRequest.fromJsonMap(Map<String, dynamic> map)
      : userName = map["userName"],
        password = map["password"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }

  @override
  LoginRequest fromJson(Map<String, dynamic> map) {
    return LoginRequest.fromJsonMap(map);
  }
}
