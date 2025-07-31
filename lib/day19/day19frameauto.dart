import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Day19ImageAuto(),
  ));
}

class Day19ImageAuto extends StatefulWidget {
  const Day19ImageAuto({super.key});
  
  @override
  State<Day19ImageAuto> createState() => _Day19ImageAutoState();
}

class _Day19ImageAutoState extends State<Day19ImageAuto> {
  late final PageController _pageController;
  Timer? _timer;
  int _currntPage = 0;

  final List<String> images = [
    'assets/snowy.png',
    'assets/hansuzi.png',
    'assets/hanyuri.png',
    'assets/123.png',
    'assets/duffy1.gif',
    'assets/duffy2.gif',
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer){
      if (_currntPage < images.length -1 ) {
        _currntPage++;
      } else {
        _currntPage = 0;
      }
      _pageController.animateToPage(_currntPage, duration: const Duration(microseconds: 500), curve: Curves.linear,);
    });
  }

  @override
  void dispose(){
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: images
          .map(
            (path) => SizedBox.expand(
              child: Image.asset(path, fit: BoxFit.fill),
            ),
      ).toList());
  }
}
