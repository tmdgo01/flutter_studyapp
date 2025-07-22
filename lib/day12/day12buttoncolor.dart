// elevated button을 각각 다른 색상, 7개를 생성
// 각 버튼을 눌렀을 때 현재 색상을 휴대폰의 배경화면의 색으로 변경
// scaffold의 body 부분을 container 안에

import 'package:flutter/material.dart';

void main() {
  runApp(Day12ButtonColorApp());
}

class Day12ButtonColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Button Color Example')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonColorWidget(),
          ),
        ),
      ),
    );
  }
}

class ButtonColorWidget extends StatefulWidget {
  @override
  _ButtonColorWidgetState createState() => _ButtonColorWidgetState();
}

class _ButtonColorWidgetState extends State<ButtonColorWidget> {
  Color _currentColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _currentColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _currentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => _changeColor(Colors.red),
            child: Text('Red'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () => _changeColor(Colors.green),
            child: Text('Green'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () => _changeColor(Colors.blue),
            child: Text('Blue'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
            onPressed: () => _changeColor(Colors.yellow),
            child: Text('Yellow'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () => _changeColor(Colors.purple),
            child: Text('Purple'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () => _changeColor(Colors.orange),
            child: Text('Orange'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: () => _changeColor(Colors.pink),
            child: Text('Pink'),
          ),
        ],
      ),
    );
  }
}
