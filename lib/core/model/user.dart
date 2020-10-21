import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  // Jsonkey sample
  @JsonKey(name: "email",required: false , nullable: true , )
  String username;
  String password;
  String token;

  User(this.username, this.password, this.token);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
