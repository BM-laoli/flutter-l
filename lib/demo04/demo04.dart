/* 关于响应式 （依据场景自动调整布局）
 自适应 （不用场景处理不同的事件，以及视觉密度等一些咧操作）
 核心思想：把组件拆分到极致，然后依据不同的排列祝贺，就可以构建出不同的应用
 所以一定是：“具备良好的顶层设计之后，开始从工程上 自底向上的构建”
*/

// 下面的例子🌰是 在Mobile的tab下现实不同的内容，mobile是跳转，table是侧边

// 首先我们需要构建每个 零件

import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  // const DetailWidget({super.key});
  final int data;
  const DetailWidget(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          children: [
            Text(
              widget.data.toString(),
              style: const TextStyle(fontSize: 36, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

typedef ItemSelectedCallback = void Function(int value);

class ListWidget extends StatefulWidget {
  final int count;
  final ItemSelectedCallback onItemSelected;

  const ListWidget(this.count, this.onItemSelected, {super.key});

  @override
  State<StatefulWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      position.toString(),
                      style: const TextStyle(fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatefulWidget {
  final int data;
  const DetailPage(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.data.toString(),
              style: const TextStyle(fontSize: 36, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

// 组合器
class MasterDetailPage extends StatefulWidget {
  const MasterDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  var isLargeScreen = false;
  @override
  Widget build(BuildContext context) {
    // 重点是获取当前场景，然后构建不同的View
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        MediaQuery.of(context).size.width > 600
            ? (isLargeScreen = true)
            : (isLargeScreen = false);

        return Row(
          children: [
            Expanded(
              child: ListWidget(10, (value) {
                if (isLargeScreen) {
                  setState(() {
                    selectedValue = value;
                  });
                } else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(value);
                    },
                  ));
                }
              }),
            ),
            isLargeScreen
                ? Expanded(child: DetailWidget(selectedValue))
                : Container(),
          ],
        );
      }),
    );
  }
}

class Demo04App extends StatelessWidget {
  const Demo04App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const MasterDetailPage(),
    );
  }
}
