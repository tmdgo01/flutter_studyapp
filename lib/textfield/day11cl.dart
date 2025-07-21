// 자기소개서 입력 화면
// 1. 이름 입력 창(5글자 제한)
// 2. 직업 입력 창(20글자 제한)
// 3. 이메일 입력 창(20글자 제한)
// 4. 자기소개 입력 창(500글자 제한, 최대 7줄 표기)

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('TextField Example')),
        body: SafeArea(
          child: Column(
            children: [
              NameInput(),
              OccupationInput(),
              EmailInput(),
              IntroductionInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        maxLength: 5,
        decoration: InputDecoration(
          labelText: '이름',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class OccupationInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: '직업',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        maxLength: 30,
        decoration: InputDecoration(
          labelText: '이메일',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class IntroductionInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        maxLength: 500,
        decoration: InputDecoration(
          labelText: '자기소개',
          border: OutlineInputBorder(),
        ),
        maxLines: 7,
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
