import 'package:networking/networking/serializable_object.dart';

import 'response_exception.dart';

class BaseResponse extends SerializableObject<BaseResponse> {
  bool? success;

  int? statusCode;

  String? message;

  ResponseException? responseException;

  BaseResponse({
    this.success,
    this.statusCode,
    this.message,
    this.responseException,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    responseException = json['responseException'] != null
        ? new ResponseException.fromJson(json['responseException'])
        : null;
  }


  BaseResponse fromJson(Map<String, dynamic> json) {
    return BaseResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.responseException != null) {
      data['responseException'] = this.responseException?.toJson();
    }
    return data;
  }
}
