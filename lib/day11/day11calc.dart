// 0 ~ 9까지의 숫자, 사칙연산 입력 버튼을 구현한 계산기 프로그램
// 숫자를 입력하고 난 후 changeText에서 받아온 +, -, *, / 버튼 중 하나이면
// 지금까지 입력 받은 수를 num1에 저장하고
// 이후 입력되는 숫자 후에 = 버튼을 누르면
// num1과 입력된 숫자를 연산하여 결과를 출력하는 프로그램
import 'package:flutter/material.dart';

class day11clacapp extends StatefulWidget {
  @override
  _day11clacappState createState() => _day11clacappState();
}

class _day11clacappState extends State<day11clacapp> {
  String displayText = '';
  double? num1;
  String operator = '';

  void onNumberPressed(String number) {
    setState(() {
      displayText += number;
    });
  }

  void onOperatorPressed(String op) {
    if (displayText.isNotEmpty) {
      num1 = double.tryParse(displayText);
      operator = op;
      setState(() {
        displayText = '';
      });
    }
  }

  void onEqualsPressed() {
    if (num1 != null && displayText.isNotEmpty) {
      double? num2 = double.tryParse(displayText);
      double result = 0;

      if (num2 == null) return;

      switch (operator) {
        case '+':
          result = num1! + num2;
          break;
        case '-':
          result = num1! - num2;
          break;
        case '*':
          result = num1! * num2;
          break;
        case '/':
          result = num2 != 0 ? num1! / num2 : 0;
          break;
        default:
          return;
      }

      setState(() {
        displayText = result.toString();
        num1 = null; // 초기화
        operator = '';
      });
    }
  }

  void onClear() {
    setState(() {
      displayText = '';
      num1 = null;
      operator = '';
    });
  }

  Widget buildButton(String text, {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed ?? () => onNumberPressed(text),
      child: Text(text, style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            displayText,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(thickness: 2),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            padding: EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ...['1', '2', '3', '/'].map(
                (e) => buildButton(
                  e,
                  onPressed: e.contains(RegExp(r'[0-9]'))
                      ? null
                      : () => onOperatorPressed(e),
                ),
              ),
              ...['4', '5', '6', '*'].map(
                (e) => buildButton(
                  e,
                  onPressed: e.contains(RegExp(r'[0-9]'))
                      ? null
                      : () => onOperatorPressed(e),
                ),
              ),
              ...['7', '8', '9', '-'].map(
                (e) => buildButton(
                  e,
                  onPressed: e.contains(RegExp(r'[0-9]'))
                      ? null
                      : () => onOperatorPressed(e),
                ),
              ),
              buildButton('C', onPressed: onClear),
              buildButton('0'),
              buildButton('=', onPressed: onEqualsPressed),
              buildButton('+', onPressed: () => onOperatorPressed('+')),
            ],
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(home: Scaffold(body: day11clacapp())));
