import 'package:networking/networking/serializable_object.dart';

class ResponseException extends SerializableObject{
  bool? isError;
  String? exceptionMessage;

  ResponseException({this.isError, this.exceptionMessage});

  ResponseException.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    exceptionMessage = json['exceptionMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['exceptionMessage'] = this.exceptionMessage;
    return data;
  }

  @override
  ResponseException fromJson(Map<String, dynamic> json) {
    return ResponseException.fromJson(json);
  }
}
