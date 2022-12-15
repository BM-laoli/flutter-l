import 'dart:convert';

import 'package:my_appls/generated/json/article.g.dart';
import 'package:my_appls/generated/json/base/json_field.dart';
import 'package:my_appls/generated/json/paging_request.g.dart';

@JsonSerializable()
class Article {

	String? title;
	String? des;
	String? createTime;
	String? author;
	String? cover;
	String? url;

	@JSONField(serialize: false)
  int? total;

  Article();

  factory Article.fromJson(Map<String, dynamic> json) => $ArticleFromJson(json);

  Map<String, dynamic> toJson() => $ArticleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

}
