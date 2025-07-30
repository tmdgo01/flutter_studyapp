import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color containerColor = Colors.grey;

  void changeColor() {
    setState(() {
      containerColor = Color(Random().nextInt(0xFFFFFFFF)).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 가운데 버튼
          Center(
            child: ElevatedButton(
              onPressed: changeColor,
              child: Text("색상 변경"),
            ),
          ),
          SizedBox(height: 40),
          // 아래 컨테이너
          Container(
            width: 200,
            height: 200,
            color: containerColor,
          ),
        ],
      ),
    );
  }
}
