import 'package:flutter/material.dart';

void main() {
  return runApp(SwitchWidgetApp());
}

class SwitchWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SwitchWidget(),
          ),
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${_isSwitched ? "ON" : "OFF"}', style: TextStyle(fontSize: 24)),
        Switch(
          value: _isSwitched,
          activeColor: Colors.indigo,
          inactiveThumbColor: Colors.black,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
          },
        ),
      ],
    );
  }
}
