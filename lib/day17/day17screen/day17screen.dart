import 'package:flutter/material.dart';
import 'package:flutter_testapp/day17/day17const/day17color.dart';

class Day17Screen extends StatelessWidget {
  const Day17Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 사이 간격, 가운데 정렬
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              // 정렬
              crossAxisAlignment: CrossAxisAlignment.center, // 가운데
              // CrossAxisAlignment.stretch, 양 옆으로 늘리기
              children:
                // map = 반복적 실행(ex : for)
                /// 람다식
                colors.map((e) => Container(width: 50, height: 50, decoration: e.decoration,),).toList(),
            ),
            // 가운데
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/123.png'),
                ),
                ),
                ),
              ]
            ),
            // 오른쪽 정렬
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children:
                colors.map((e) => Container(width: 50, height: 50, decoration: e.decoration,),).toList()
            ),
            // 가운데 정렬
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/123.png'),
                  ),
                  ),
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day17Screen(),
    ),
  );
}
