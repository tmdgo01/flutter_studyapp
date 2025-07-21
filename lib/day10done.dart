import 'package:flutter/material.dart';
import 'package:flutter_testapp/day10demo.dart';
import 'package:flutter_testapp/day9main.dart';
import 'package:flutter_testapp/day9.dart';
import 'package:flutter_testapp/day10fcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _title = "Flutter SketchApp";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: const MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('GO', style: optionStyle),
  //   Text('HOME', style: optionStyle),
  //   Text("NOW", style: optionStyle),
  // ];

  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  // static const TextStyle optionStyle = TextStyle(
  //   fontSize: 30,
  //   fontWeight: FontWeight.bold,
  // );

  final List<Widget> _widgetOptions = <Widget>[
    day9App(),
    day10App(),
    CounterApp(),
    ColorGridApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter SketchApp')),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Scaffold(
            body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_run),
                  label: 'Go',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.now_widgets),
                  label: 'Now',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.color_lens),
                  label: 'Colors',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.indigoAccent,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
