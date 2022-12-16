import 'package:flutter/material.dart';
import 'package:my_appls/templateProject/pages/article_details/article_details_view.dart';
import 'package:my_appls/templateProject/pages/article_lists/article_lists_view.dart';
import 'package:my_appls/templateProject/routers/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DrawStateLogic extends GetxController {
  final BuildContext? _context;
  setContext(BuildContext _context) {
    this._context = _context;
  }

  openDraw() {
    if(this._context != null) {
      Scaffold.of(this._context!).openDrawer();
    }
  }
}

class HomePage extends StatelessWidget {
  final drawStateLogic = Get.put<DrawStateLogic>(DrawStateLogic(),
      tag: 'DrawStateLogic', permanent: true);

  @override
  Widget build(BuildContext context) {
    drawStateLogic.setContext(context);
    // TODO: implement build
    return SafeArea(
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: NavigationHomePage(),
          drawer: const Drawer(
            child: Center(
              child: Text('data'),
            ),
          ),
        ));
  }
}

class NavigationHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          color: Colors.blue,
          child: TabBar(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.email),
              ),
            ],
            controller: controller,
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [CounterPage(), ArticleListsPage()],
        ));
  }
}

class CounterPage extends StatelessWidget {
  final controller = Get.find<CounterController>();
  final state = Get.find<CounterController>().state;
  final drawStateLogic = Get.find<DrawStateLogic>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(Get.context!, designSize: const Size(360, 690));

    return Scaffold(body: GetBuilder<CounterController>(builder: (controller) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("${SR.hello.tr} : ${state.count}", style: TextStyle(fontSize: 50.sp),),
            ElevatedButton(
                onPressed: () => controller.login("123456"),
                child: const Text("正常登录")),
            ElevatedButton(
                onPressed: () => controller.loginError(true),
                child: const Text("错误登录")),
            Text(
              "登录用户：${state.user?.username ?? ""}",
              style: TextStyle(fontSize: 20.sp),
            ),
            ElevatedButton(
                onPressed: () => controller.loginError(false),
                child: const Text("异常处理 返回 false")),
            ElevatedButton(
                onPressed: () => controller.loginError(true),
                child: const Text("异常处理 返回 true")),
            Text(
              "错误信息：${state.errorMessage ?? ""}",
              style: TextStyle(fontSize: 20.sp),
            ),
            ElevatedButton(
                onPressed: () => controller.loginLoading(true),
                child: const Text("显示loading")),
            ElevatedButton(
                onPressed: () => controller.loginLoading(false),
                child: const Text("不显示loading")),
            ElevatedButton(
                onPressed: () => controller.switchApi(),
                child: const Text("切换环境")),
            ElevatedButton(
                onPressed: () {
                  // Get.toNamed(RouteGet.pageX);
                  // Scaffold.of(context).openDrawer();
                  // Scaffold? sca = context.findAncestorWidgetOfExactType<Scaffold>();
                  drawStateLogic.openDraw();
                },
                child: const Text("Go List Page"))
          ],
        ),
      );
    }));
  }
}
