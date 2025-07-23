// 메인 페이지
import 'package:flutter/material.dart';

void main() {
  runApp(maindPage());
}

class maindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('두 번째 페이지')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // navigatonr.pop
              Navigator.pop(context);
            },
            child: Text('뒤로 가기'),
          ),
        ),
      ),
    );
  }
}
