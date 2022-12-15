import 'package:flutter/material.dart';

// 一个综合案例
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = true;
  int _favoriteCount = 41;

  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields
}

class FavoriteApp extends StatelessWidget {
  const FavoriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          const FavoriteWidget(),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _builderButtonCoulum(color, Icons.call, 'CALL'),
            _builderButtonCoulum(color, Icons.near_me, 'ROUTE'),
            _builderButtonCoulum(color, Icons.share, 'SHARE')
          ],
        ),
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset('images/lake.png',
                width: 600, height: 240, fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Column _builderButtonCoulum(Color color, IconData icon, String label) {
  return Column(
    children: [
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color)),
      )
    ],
  );
}
