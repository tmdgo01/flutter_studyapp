// TODO : 제출 버튼 수정

import 'package:flutter/material.dart';

void main() {
  runApp(Day11ClApp());
}

class Day11ClApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('자기소개서 입력')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameInput(),
                  OccupationInput(),
                  EmailInput(),
                  IntroductionInput(),
                  SubmitButton(
                    onPressed: () {
                      print("제출됨: 이름, 직업, 이메일, 자기소개");
                    },
                  ),
                  SizedBox(height: 20),
                  InputResult(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NameInput extends StatefulWidget {
  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLength: 5,
      decoration: InputDecoration(
        labelText: '이름',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class OccupationInput extends StatefulWidget {
  @override
  _OccupationInputState createState() => _OccupationInputState();
}

class _OccupationInputState extends State<OccupationInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLength: 20,
      decoration: InputDecoration(
        labelText: '직업',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class EmailInput extends StatefulWidget {
  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLength: 30,
      decoration: InputDecoration(
        labelText: '이메일',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class IntroductionInput extends StatefulWidget {
  @override
  _IntroductionInputState createState() => _IntroductionInputState();
}

class _IntroductionInputState extends State<IntroductionInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLength: 500,
      decoration: InputDecoration(
        labelText: '자기소개',
        border: OutlineInputBorder(),
      ),
      maxLines: 7,
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed; // onPressed 파라미터

  SubmitButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // 버튼이 눌렸을 때 onPressed 실행
      child: Text('제출'),
    );
  }
}

class InputResult extends StatelessWidget {
  final String name = "홍길동"; // 예시 입력 값
  final String occupation = "프로그래머";
  final String email = "hong@example.com";
  final String introduction = "저는 열정적으로 코드를 작성하는 프로그래머입니다.";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('이름: $name', style: TextStyle(fontSize: 16)),
        Text('직업: $occupation', style: TextStyle(fontSize: 16)),
        Text('이메일: $email', style: TextStyle(fontSize: 16)),
        Text('자기소개: $introduction', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
