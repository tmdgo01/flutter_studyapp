import 'package:flutter/material.dart';

// checkbox 예제
void main() {
  runApp(day12checkboxapp());
}

class day12checkboxapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkbox Example')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CheckboxWidget(),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '이용 약관에 동의하십니까? \n${_isChecked ? "예" : "아니오"}',
          style: TextStyle(fontSize: 24),
        ),
        Checkbox(
          value: _isChecked,
          activeColor: Colors.indigo,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
