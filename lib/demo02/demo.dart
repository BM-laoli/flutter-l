// demo02
import 'package:flutter/material.dart';

// 一个最简单的布局
class BlueBox extends StatelessWidget {
  const BlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}

class BlueBoxMyApp extends StatelessWidget {
  const BlueBoxMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fff',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flu'),
        ),
        body: const BlueBox(),
      ),
    );
  }
}
