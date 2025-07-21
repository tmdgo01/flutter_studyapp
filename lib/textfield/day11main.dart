import 'package:flutter/material.dart';
import 'day11txtfield.dart';
import 'day11numbers.dart';
import 'day11cl.dart';
import 'day11addbutton.dart';

void main() => runApp(day11App());

class day11App extends StatelessWidget {
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
    day11clapp(),
    Day11AddButton(),
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
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '123Button'),
        ],
      ),
    );
  }
}
