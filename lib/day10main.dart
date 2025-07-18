// day10
// StatelessWidget Demo

import 'package:flutter/material.dart';

void main() {
  runApp(day10App());
}

class day10App extends StatelessWidget {
  final Map info = {
    "appTitle": "StatelessWidget Demo",
    "appBarTitle": "Flutter official Site",
    "titleImageLink":
        "https://storage.googleapis.com/cms-storage-bucket/2f118a9971e4ca6ad737.png",
    "titleSectionHeader": "Flutter on Mobile",
    "titleSectionBody": "https://flutter.dev/multi-platform/mobile",
    "textSection":
        "Flutter is Google's UI toolkit for building beautiful, "
        "Bring your app idea to more users from day one by"
        " building with Flutter.",
  };

  @override
  Widget build(BuildContext context) {
    final titleimage = _buildTitleimage(info['titleImageLink']!);
    Widget textsection = _buildTextSection(info['textSection']!);
    Widget buttonsection = _buildButtonSection();
    Widget titlesection = _buildTitleSection(
      info['titleSectionHeader']!,
      info['titleSectionBody']!,
    );

    return MaterialApp(
      title: info['appTitle']!,
      home: Scaffold(
        appBar: AppBar(title: Text(info['appBarTitle']!), centerTitle: true),
        body: ListView(
          children: [titleimage, titlesection, textsection, buttonsection],
        ),
      ),
    );
  }
}

Image _buildTitleimage(String imageName) {
  return Image.network(imageName, width: 600, height: 240, fit: BoxFit.cover);
}

Container _buildTitleSection(String name, String addr) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(addr, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        const Counter(),
      ],
    ),
  );
}

Widget _buildButtonSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      StatefulButtonColumn(
        baseColor: Colors.black,
        icon: Icons.assistant_navigation,
        label: "Visit",
      ),
      StatefulButtonColumn(
        baseColor: Colors.black,
        icon: Icons.add_alert_sharp,
        label: "Alarm",
      ),
      StatefulButtonColumn(
        baseColor: Colors.black,
        icon: Icons.share,
        label: "Share",
      ),
    ],
  );
}

Container _buildTextSection(String section) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      section,
      softWrap: true,
      textAlign: TextAlign.justify,
      style: const TextStyle(height: 1.5, fontSize: 15),
    ),
  );
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counter = 0;
  bool _boolStatus = false;
  Color _stateColor = Colors.black;

  void _buttonPressed() {
    setState(() {
      _boolStatus = !_boolStatus;
      _counter += _boolStatus ? 1 : -1;
      _stateColor = _boolStatus ? Colors.red : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.star),
          onPressed: _buttonPressed,
          color: _stateColor,
        ),
        Text("$_counter"),
      ],
    );
  }
}

// Stateful 위젯
class StatefulButtonColumn extends StatefulWidget {
  final Color baseColor;
  final IconData icon;
  final String label;

  const StatefulButtonColumn({
    Key? key,
    required this.baseColor,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  State<StatefulButtonColumn> createState() => _StatefulButtonColumnState();
}

class _StatefulButtonColumnState extends State<StatefulButtonColumn> {
  bool _isSelected = false;

  void _toggleColor() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = _isSelected ? Colors.red : widget.baseColor;

    return GestureDetector(
      onTap: _toggleColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: currentColor),
          const SizedBox(height: 8),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: currentColor,
            ),
          ),
        ],
      ),
    );
  }
}
