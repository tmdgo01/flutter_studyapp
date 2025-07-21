import 'package:flutter/material.dart';
import 'day11txtfield.dart';
import 'day11numbers.dart';
import 'day11cl.dart';
import 'day11addbutton.dart';

void main() => runApp(Day11App());

class Day11App extends StatelessWidget {
  final String _title = "TextField Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // ← 수정된 부분
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    NormalTextFieldWidget(), // From day11txtfield.dart
    CombinedTextFieldWidget(), // From day11numbers.dart
    Day11ClApp(), // From day11cl.dart (클래스 이름 UpperCamelCase 사용 권장)
    Day11AddButton(), // From day11addbutton.dart
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
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
      appBar: AppBar(title: const Text('Enter Example')),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigoAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'TextField',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: 'Numbers'),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
      ),
    );
  }
}
