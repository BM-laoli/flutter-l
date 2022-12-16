import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_appls/templateProject/routers/routers.dart';

import '../res/string_res/str_res.dart';

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
