import 'dart:convert';
import 'package:my_appls/generated/json/base/json_field.dart';
import 'package:my_appls/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
   String? userId;
   String? username;
   int? age;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
