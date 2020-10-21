// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['email'] as String, json['password'] as String,
      json['token'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.username,
      'password': instance.password,
      'token': instance.token
    };
