import 'dart:convert';
import 'package:my_appls/generated/json/base/json_field.dart';
import 'package:my_appls/generated/json/school_entity.g.dart';

@JsonSerializable()
class SchoolEntity {

	String? name;
  
  SchoolEntity();

  factory SchoolEntity.fromJson(Map<String, dynamic> json) => $SchoolEntityFromJson(json);

  Map<String, dynamic> toJson() => $SchoolEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}