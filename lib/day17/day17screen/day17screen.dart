import 'package:flutter/material.dart';
import 'package:flutter_testapp/day17/day17const/day17color.dart';

class Day17Screen extends StatelessWidget {
  const Day17Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.pinkAccent,
          child: Column( // or Row
            // 변함없음
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children:
              // map = 반복적 실행(ex : for)
              /// 람다식
              colors.map((e) => Container(width: 50, height: 50, color: e,),).toList(),
          ),
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
