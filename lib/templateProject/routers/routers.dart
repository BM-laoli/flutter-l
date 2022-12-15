import 'package:my_appls/templateProject/pages/article_details/article_details_binding.dart';
import 'package:my_appls/templateProject/pages/article_details/article_details_view.dart';
import 'package:my_appls/templateProject/pages/article_lists/article_lists_binding.dart';
import 'package:my_appls/templateProject/pages/article_lists/article_lists_view.dart';
import 'package:my_appls/templateProject/pages/counter/binding.dart';
import 'package:my_appls/templateProject/pages/counter/view.dart';
import 'package:get/get.dart';
 
class RouteGet { 
  ///root page 
  static const String main = "/"; 
  static const String article = "/article";
  static const String articleDetails = "/articleDetails";

  ///pages map 
  static final List<GetPage> getPages = [ 
    GetPage(
        name: main,
        page: () => CounterPage(),
        binding: CounterBinding()
    ),
    GetPage(
        name: article,
        page: () => ArticleListsPage(),
        binding: ArticleListsBinding()
    ),
    GetPage(
        name: articleDetails,
        page: () => ArticleDetailsPage(),
        binding: ArticleDetailsBinding()
    ),
  ]; 
}