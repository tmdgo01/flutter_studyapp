import 'package:flutter/material.dart';

class NormalTextFieldWidget extends StatefulWidget {
  @override
  State<NormalTextFieldWidget> createState() => _NormalTextFieldWidgetState();
}

class _NormalTextFieldWidgetState extends State<NormalTextFieldWidget> {
  String _text = '';

  // maxlines 사용
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Enter text",
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
            onChanged: (value) {
              setState(() {
                _text = value;
              });
            },
          ),
          SizedBox(height: 20),
          Text(_text, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
