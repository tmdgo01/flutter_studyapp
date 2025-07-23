import 'package:flutter/material.dart';

class CombinedTextFieldWidget extends StatefulWidget {
  @override
  State<CombinedTextFieldWidget> createState() =>
      _CombinedTextFieldWidgetState();
}

// (숫자만 입력 가능)입력 창 2개 만들어서 입력 받은 값을 +, -, *, / 연산을 할 수 있는 위젯
// 결과를 텍스트 4줄로 출력
// 5 + 3 = 8
// 5 - 3 = 2
// 5 * 3 = 15
// 5 / 3 = 1.67

class _CombinedTextFieldWidgetState extends State<CombinedTextFieldWidget> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculate() {
    final num1 = double.tryParse(_controller1.text);
    final num2 = double.tryParse(_controller2.text);

    if (num1 != null && num2 != null) {
      setState(() {
        _result =
            ''
            '$num1 + $num2 = ${num1 + num2}\n'
            '$num1 - $num2 = ${num1 - num2}\n'
            '$num1 * $num2 = ${num1 * num2}\n'
            '$num1 / $num2 = ${(num1 / num2).toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _result = 'Invalid input';
      });
    }
  }

  // 결과 값은 세로
  // 입력 창은 가로로 배치
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller1,
                  decoration: InputDecoration(
                    labelText: "first number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _controller2,
                  decoration: InputDecoration(
                    labelText: "second number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _calculate, child: Text('Calculate')),
          SizedBox(height: 20),
          Text(_result, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
