import 'package:flutter/material.dart';

void main() {
  runApp(day10App());
}

class day10App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.stars, size: 50, color: Colors.red),
        Icon(Icons.star, size: 50, color: Colors.green),
        Icon(Icons.star_border, size: 50, color: Colors.blue),
      ],
    );

    final item2 = const Text(
      '2222 REviewers',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: 'RobotoMono',
        letterSpacing: 0.5,
        fontSize: 20,
        color: Colors.blue,
      ),
    );

    final item3 = Icon(Icons.kitchen, color: Colors.brown[500]);
    final item4 = Icon(Icons.timer, color: Colors.brown[500]);
    final item5 = Icon(Icons.restaurant, color: Colors.brown[500]);
    final item6 = const Text('kitchen');
    final item7 = const Text('timer');
    final item8 = const Text('restaurant');

    final group1 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item1, item2],
    );

    final group2 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item3, item6],
    );

    final group3 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item4, item7],
    );

    final group4 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item5, item8],
    );

    final group5 = DefaultTextStyle.merge(
      style: const TextStyle(
        fontSize: 20,
        color: Colors.blue,
        fontWeight: FontWeight.w800,
        fontFamily: 'RobotoMono',
        letterSpacing: 0.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [item3, item6, item4, item7, item5, item8],
      ),
    );

    final groupAggregated = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(padding: const EdgeInsets.all(10), child: group2),
          group3,
          group4,
        ],
      ),
    );

    // Appbar 센터 정렬
    final appBar = AppBar(
      title: const Text('Multiplication Window'),
      centerTitle: true,
    );

    return MaterialApp(
      title: 'Reviewers App',
      home: Scaffold(
        appBar: appBar,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            group1,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [groupAggregated],
            ),
            const SizedBox(height: 20),
            group5,
          ],
        ),
      ),
    );
  }
}
