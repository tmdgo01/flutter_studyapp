import 'package:flutter/material.dart';
import 'day11txtfield.dart';
import 'day11numbers.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final title = "TextField Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: title, home: HomeScreen());
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
    NormalTextFieldWidget(),
    CombinedTextFieldWidget(),
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
        physics: NeverScrollableScrollPhysics(), // 손으로 넘기지 못하도록
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'TextField',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: 'Numbers'),
        ],
      ),
    );
  }
}
