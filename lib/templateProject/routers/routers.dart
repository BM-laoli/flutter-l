import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_appls/templateProject/pages/article_details/article_details_binding.dart';
import 'package:my_appls/templateProject/pages/article_details/article_details_view.dart';
import 'package:my_appls/templateProject/pages/article_lists/article_lists_binding.dart';
import 'package:my_appls/templateProject/pages/article_lists/article_lists_view.dart';
import 'package:my_appls/templateProject/pages/counter/binding.dart';
import 'package:my_appls/templateProject/pages/counter/view.dart';
import 'package:get/get.dart';


class PageX extends StatelessWidget {
  const PageX({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text('2x') ,
      ),
      body: const Text('22'),
    );
  }
}
class RouteGet { 
  ///root page
  static const String main = "/";
  static const String article = "/article";
  static const String articleDetails = "/articleDetails";
  static const String pageX = "/pageX";

  ///pages map 
  static final List<GetPage> getPages = [
    // tabNavigation
    GetPage(
        name: main,
        page: () => HomePage(),
        bindings: [CounterBinding(), ArticleListsBinding()]
    ),
    GetPage(
        name: articleDetails,
        page: () => ArticleDetailsPage(),
        binding: ArticleDetailsBinding()
    ),
    GetPage(
        name: pageX,
        page: () => PageX(),
    ),

  ];
}