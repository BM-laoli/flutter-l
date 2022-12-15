import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_appls/demo02/demo.dart';
import 'package:my_appls/demo04/demo04.dart';
import 'package:my_appls/templateProject/mainde.dart';

void  main () async {
  await ScreenUtil.ensureScreenSize();
  runApp(const TemplateProject());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'flutter layout demo',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('flutter layout demo'),
  //       ),
  //       body: ListView(
  //         children: const [BlueBox()],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'flutter demno',
        home:Scaffold(
          appBar: AppBar(
            title: const Text('FLutter Demo'),
          ),
          body: ListView(
            children: [BlueBox()],
          ),
        ),

    );
  }
}
