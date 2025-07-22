// radio button example
import 'package:flutter/material.dart';

void main() {
  runApp(RadioButtonApp());
}

class RadioButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Radio Button Example')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RadioButtonWidget(),
          ),
        ),
      ),
    );
  }
}

class RadioButtonWidget extends StatefulWidget {
  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String _selectedOption = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Selected: $_selectedOption', style: TextStyle(fontSize: 24)),
        ListTile(
          title: const Text('1'),
          leading: Radio<String>(
            value: '1',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('2'),
          leading: Radio<String>(
            value: '2',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
