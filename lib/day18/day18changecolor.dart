import 'package:flutter/material.dart';
import 'package:flutter_testapp/day12/day12buttoncolor.dart';

void main(){
  runApp(day18colorchange());
}

class day18colorchange extends StatelessWidget {
  const day18colorchange({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonColorWidget(),
          ),
        ),
      ),
    );
  }
}

class ButtonColorWidget extends StatefulWidget {
  @override
  _ButtonColorWidgetState creatState() => _ButtonColorWidgetState();
  
}

class _ButtonColorWidgetState extends State<ButtonColorWidget>{
  Color _day18Color = Colors.white30;

  void _day18changeColor(Color color){
    setState(() {
      _day18Color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _day18Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () => _day18changeColor(child: Text("change"), Colors.white30), child: null,),
        ],
      ),
    );
  }
}