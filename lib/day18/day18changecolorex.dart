import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorTogglePage(),
    );
  }
}

class ColorTogglePage extends StatefulWidget {
  @override
  _ColorTogglePageState createState() => _ColorTogglePageState();
}

class _ColorTogglePageState extends State<ColorTogglePage> {
  Color _boxColor = Colors.blue;

  void _toggleColor() {
    setState(() {
      _boxColor = _boxColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _toggleColor,
              child: Text('색상 변경'),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              color: _boxColor,
            ),
          ],
        ),
      ),
    );
  }
}
