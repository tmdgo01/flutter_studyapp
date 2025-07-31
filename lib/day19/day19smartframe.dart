import 'package:flutter/material.dart';

void main () {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Day19Image(),)
  );
}

class Day19PageView extends StatefulWidget {
  const Day19PageView({super.key});

  @override
  State<Day19PageView> createState() => _Day19PageViewState();
}

class _Day19PageViewState extends State<Day19PageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Day19Image(),
    );
  }
}

class Day19Image extends StatelessWidget {
  const Day19Image({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        SizedBox.expand(child: Image.asset('assets/snowy.png', fit: BoxFit.fill,),),
        SizedBox.expand(child: Image.asset('assets/hanyuri.png', fit: BoxFit.fill,),),
        SizedBox.expand(child: Image.asset('assets/hansuzi.png', fit: BoxFit.fill,),),
    ],
    );
  }
}

