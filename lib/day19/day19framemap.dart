import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Day19ImageMap(),
  ));
}

class Day19ImageMap extends StatefulWidget {
  const Day19ImageMap({super.key});

  @override
  State<Day19ImageMap> createState() => _Day19ImageMap();
}

class _Day19ImageMap extends State<Day19ImageMap> {
  late final PageController _pageController;

  final List<String> images = [
    'assets/snowy.png',
    'assets/hansuzi.png',
    'assets/hanyuri.png',
    'assets/123.png',
    'assets/duffy1.gif',
    'assets/duffy2.gif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          // controller: _pageController,
          children: images
              .map(
                (path) => SizedBox.expand(
              child: Image.asset(path, fit: BoxFit.fill),
            ),
          ).toList()
      ),
    );
  }
}

