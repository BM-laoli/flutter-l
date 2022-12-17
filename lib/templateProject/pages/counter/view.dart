import 'package:flutter/material.dart';
import 'package:my_appls/templateProject/pages/article_lists/article_lists_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_appls/templateProject/routers/routers.dart';

import 'controller.dart';

/// 自定义广播通知，处理draw事件

enum EnumDrawEvent {
  open,
  close
}

class DrawStateNotification extends Notification {
  DrawStateNotification(this.msg);
  final EnumDrawEvent msg;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  bool onDrawChange(DrawStateNotification notification, BuildContext ctx) {
    if (notification.msg == EnumDrawEvent.open) {
      Scaffold.of(ctx).openDrawer();
    }

    if (notification.msg == EnumDrawEvent.close) {
      Scaffold.of(ctx).closeDrawer();
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Builder(builder: (ctx) {
          /// 注意Scaffold 中ctx 和 上层的 ctx 不是同一个东西
          return NotificationListener<DrawStateNotification>(
            onNotification: (notification) => onDrawChange(notification, ctx),
            child: const NavigationHomePage(),
          );
        }),
        drawer: Builder(builder: (ctx) {
          return NotificationListener<DrawStateNotification>(
              onNotification: (notification) => onDrawChange(notification, ctx),
              child: const DrawPage());
        }),
      ),
    );
  }
}

/// NavigationHomePageBottom
class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({super.key});

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

/// DrawPage
class DrawPage extends StatelessWidget {
  const DrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: Center(
      child: ElevatedButton(
        child: const Text('222'),
        onPressed: () {
          Get.toNamed(RouteGet.pageX);
          DrawStateNotification(EnumDrawEvent.close).dispatch(context);
        },
      ),
    ));
  }
}

class CounterPage extends StatelessWidget {
  final controller = Get.find<CounterController>();
  final state = Get.find<CounterController>().state;

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
                  DrawStateNotification(EnumDrawEvent.open).dispatch(context);
                },
                child: const Text("Go List Page"))
          ],
        ),
      );
    }));
  }
}
