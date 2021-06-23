import 'package:networking/networking.dart';

import 'validation_error.dart';

class Error implements SerializableObject<Error> {
  String? correlationId;
  int? code;
  String? message;
  String? details;
  List<ValidationError>? validationError;

  Error({this.correlationId, this.code, this.message, this.details, this.validationError});

  Error.fromJson(Map<String, dynamic> json) {
    correlationId = json['correlationId'];
    code = json['code'];
    message = json['message'];
    details = json['details'];
    if (json['validationError'] != null) {
      validationError = <ValidationError>[];
      json['validationError'].forEach((v) {
        validationError?.add(new ValidationError.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['correlationId'] = this.correlationId;
    data['code'] = this.code;
    data['message'] = this.message;
    data['details'] = this.details;
    if (this.validationError != null) {
      data['validationError'] = this.validationError?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Error fromJson(Map<String, dynamic> json) {
    return Error.fromJson(json);
  }
}
