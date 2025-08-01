import 'package:flutter_testapp/day11/day11calc.dart';
import 'package:flutter_testapp/day11/day11txtfield.dart';
import 'day12switch.dart';
import 'day12checkbox.dart';
import 'day12radiobu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _title = 'Flutter 예제';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: const MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  final List<Widget> _widgetOptions = <Widget>[
    NormalTextFieldWidget(),
    day11clacapp(),
    SwitchWidgetApp(),
    day12checkboxapp(),
    RadioButtonApp(),
  ];

  final PageController _pageController = PageController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 예제')),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Scaffold(
            body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.note_add),
                  label: "자소서 작성",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calculate),
                  label: "계산기",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.switch_left),
                  label: "스위치",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_box),
                  label: "체크박스",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.radio_button_checked),
                  label: "라디오 버튼",
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
