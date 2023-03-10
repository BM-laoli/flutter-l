import 'dart:convert';
import 'package:my_appls/generated/json/base/json_field.dart';
import 'package:my_appls/models/api_response/api_response_entity.g.dart';

class ApiResponse<T> {

	int? code;
	String? message;
	T? data;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
