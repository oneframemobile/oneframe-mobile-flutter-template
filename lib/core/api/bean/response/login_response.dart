import 'package:networking/networking/serializable_object.dart';
import 'package:flutter_provider/core/api/bean/response/claim_list_response.dart';

import '../base_response.dart';
import 'claim_response.dart';

class LoginResponse
    with BaseResponse
    implements SerializableObject<LoginResponse> {
  List<ClaimResponse> claims;
  String token;

  LoginResponse();

  LoginResponse.fromJsonMap(Map<String, dynamic> json)
      : token = json["token"],
        claims = ClaimListResponse().fromJsonList(json["claims"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['claims'] = claims;
    return data;
  }

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse.fromJsonMap(json["result"]);
  }
}
