import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_appls/templateProject/routers/routers.dart';

import '../res/string_res/str_res.dart';

// void main() async {
//   await ScreenUtil.ensureScreenSize();
//   runApp(const MyApp());
// }

class TemplateProject extends StatelessWidget {
  const TemplateProject({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
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
