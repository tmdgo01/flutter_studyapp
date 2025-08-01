// 숫자 버튼 입력 기능
// 1 ~ 3까지의 버튼과 지우기 버튼 구현
// 입력된 숫자를 text 필드에 표시
// 지우기 버튼을 누르면 text 필드의 내용이 지워짐

import 'package:flutter/material.dart';

class day11_123button extends StatefulWidget {
  @override
  _day11_123buttonState createState() => _day11_123buttonState();
}

class _day11_123buttonState extends State<day11_123button> {
  String _input = '';

  void _addNumber(String number) {
    setState(() {
      _input += number;
    });
  }

  void _clearInput() {
    setState(() {
      _input = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Input',
            border: OutlineInputBorder(),
          ),
          controller: TextEditingController(text: _input),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => _addNumber('1'), child: Text('1')),
            ElevatedButton(onPressed: () => _addNumber('2'), child: Text('2')),
            ElevatedButton(onPressed: () => _addNumber('3'), child: Text('3')),
            ElevatedButton(onPressed: _clearInput, child: Text('Clear')),
          ],
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(home: Scaffold(body: day11_123button())));
