# flutter 的练习场

## hot load

> 目前这个东西，现在还是有些问题的，我们使用这样的方式来处理

> 公司的电脑 不顶用 需要cd 到  download 下把 flutter cli搞上; 然后就是IOS 的热更新有点问题，你需要这样运行( 之前这个是有他的有关的issue 我给忘记啦 ，遇到在说)

```shell
export PATH="$PATH:`pwd`/flutter/bin"

# 在 当前shell 窗口cd 到目录下去
flutter run 

```

## demo

> DemoXXX 下都是和官方文档相关的具体实践，

## templateProject

> 这个下面是一个 项目模板有关的东西，来源自掘金 [Flutter 框架搭建](https://juejin.cn/column/7041029900316180494 )
> json这个插件，我不得不 使用AndroidStudio 开发，不过相比之下 flutter 开发中 androidStudio 确实要比vscode 更加的高效和便捷

> 就来讲讲道理，全部的文件都应该收敛到templayeProject 目录下，但是由于用来一些pluging都是项目级别的setting ，我就没有去改他们的设置了
> module& generated.json & res/string_res 为了配合 IDE插件和 sdk要求，就统统放在外面了

### 目标
> 我们希望能构建一个基础的Flutter开发骨架, 可以快速方便的开发flutter项目，不需要反复的去构建 项目基础的骨架
1. GetX状态管理 和构建模型
2. JSON的构建模式
3. Router的实现 Tab 和 Stack 以及 Draw
4. Http的封装和使用
5. WebView（非核心非重点）

### Tab的切换实现
>  首先需要说明的是 ，GetX 官方没有给出各种类型的router的构建说明，只是简单的给出了一个全局stack的构建方案，
> 在github和Google 上有不少的大神 用自己的方式构建出了 tab的切换，我这里使用官方的方式构建了一个tab ，关于draw 也是如此，
> 其它的内容，这里就不说了 在 [Flutter 框架搭建](https://juejin.cn/column/7041029900316180494 ) 都有说明

  核心点就是分离 Getx 如何融合，我这里选择的方式，Getx做全局，我的Tab 和Draw 做他的首评 Page, *虽然Gext 做路由管理了，但是总体上来看Flutte的Page
和App依然上单独Wideget构建的，所以你可以任意组合出自己想要的模式*

```dart

/// 入口可以不去管他
class TemplateProject extends StatelessWidget {
  const TemplateProject({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGet.main,
      getPages: RouteGet.getPages,
      translations: StringRes(),
      locale: const Locale('zh', 'CN'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}


/// 主要上把tab 页面做成index stack 主页就好了
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


```

### 关于Appbar高度和 SafeAre 不适配的问题
> 这里的主要的问题就是两个东西配合起来用 不合适，总是会导致 AppBar 太高，于是我想了个办法 **SafeAre 并不是App全局都需要，而是给需要的东西加就好了**
> 不需要的东西不需要加；然后我只是加到了 ，MainPage上，把高度取了，但是底边还是一样有问题，于是直接给他加了个高度

```dart

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


/// main 结构
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
    return SafeArea( /// 只有这里加Safeare 其它的Page看情况加
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


```

### Draw切换的实
> 上面也给到了 具体的实现，主要困难点还是 这个跨 组件的 Notification 

```dart

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

```
### 全局的Page切换
> 直接使用  Getx.to 就好了


## 疑难杂症

1. 关于 webview_flutter的问题，我看一下，既然它的lib中写的android gralod 写目标是32 最低是19，那么我就使用它提供的版本去配置了

```
android {
    //    compileSdkVersion flutter.compileSdkVersion
    compileSdkVersion 32
    //....
    defaultConfig {
      minSdkVersion 19
      targetSdkVersion 32
    }
}

```
这样问题就处理了

2. 关于找不到ios 模拟器，无法识别的问题，请使用最新的Xcode13，被逼无奈还是得升级catlina 系统
3. 关于Joney自己的MacPro的启动问题，现在需要通过命令行启动，要不然无法识别到IOS模拟器，

## 总结
1. 这个仓库 主要还是做联系用的，和学习用的，
2. 关于项目的结构，大部分联系都是独立的demo 性质 demo都是独立的文件夹，但是有些案例的demo 做不到独立 ，比如template 会有特别的说明，其它都是独立的
3. 如果你希望快速的开发工程项目，请直接去 取 template的东西就够用的，我把东西都给你准备好了
4. 关于后续的更新，这个仓库会一直在这里更下去，主要还是努力的学习flutter 哈
