import 'package:flutter/material.dart';

void main() {
  runApp(Day13MainApp());
}

class Day13MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TextButton Example')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButtonWidget(),
          ),
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatefulWidget {
  @override
  _TextButtonWidgetState createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextButton
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('TextButton Pressed')));
            },
            child: Text('Press Me'),
          ),
          SizedBox(height: 20),
          // icon button with text
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.thumb_up),
            label: Text('Like'),
          ),
          SizedBox(height: 20),
          // elevated button
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Elevated Button Pressed')),
              );
            },
            child: Text('Elevated Button'),
          ),
          SizedBox(height: 20),
          // outlined button
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Outlined Button Pressed')),
              );
            },
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Text('Outlined Button'),
          ),
          SizedBox(height: 20),
          // icon button
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Icon Button Pressed')));
            },
          ),

          // Checkbox to enable/disable button
          CheckboxListTile(
            title: Text("동의함"),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),

          SizedBox(height: 20),
          TextButton(
            onPressed: _isChecked
                ? () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Button Enabled')));
                  }
                : null, // 비활성화 상태
            child: Text('Submit'),
            style: TextButton.styleFrom(
              foregroundColor: _isChecked ? Colors.white : Colors.grey[400],
              backgroundColor: _isChecked ? Colors.blue : Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
