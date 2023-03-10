import 'package:flutter/material.dart';
import 'package:my_appls/templateProject/components/refresh.dart';
import 'package:my_appls/models/article.dart';
import 'package:my_appls/templateProject/routers/routers.dart';
import 'package:get/get.dart';

import 'article_lists_controller.dart';

class ArticleListsPage extends StatelessWidget {
  final controller = Get.find<ArticleListsController>();
  final state = Get.find<ArticleListsController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        buildRefreshListWidget<Article, ArticleListsController>(
            itemBuilder: (item, index) {
      return _buildItem(item);
    }));
  }

  Card _buildItem(Article item) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title ?? "",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item.author ?? "",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            item.createTime ?? "",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.des ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                item.cover?.isNotEmpty == true
                    ? Image.network(
                        item.cover ?? "",
                        width: 100,
                        height: 65,
                        fit: BoxFit.cover,
                      )
                    : Container()
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteGet.articleDetails,
                      arguments: {"article": item});
                },
                child: const Text("Detail"))
          ],
        ),
      ),
    );
  }
}
