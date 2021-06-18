import 'package:networking/networking/serializable_object.dart';

class LoginResponse implements SerializableObject<LoginResponse> {
  String? token;
  String? refreshToken;
  LoginResponse() {}
  LoginResponse.fromJsonMap(Map<String, dynamic> json)
      : token = json["token"],
        refreshToken = json["refreshToken"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    return data;
  }

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse.fromJsonMap(json["result"]);
  }
}
