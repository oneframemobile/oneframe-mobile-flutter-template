import 'package:networking/networking.dart';

class ValidationError implements SerializableObject<ValidationError> {
  String? message;

  ValidationError({this.message});

  ValidationError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }

  @override
  ValidationError fromJson(Map<String, dynamic> json) {
    return ValidationError.fromJson(json);
  }
}
