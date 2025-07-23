import 'package:flutter/material.dart';

void main() {
  runApp(const ColorGridApp());
}

// 앱 루트 위젯
class ColorGridApp extends StatelessWidget {
  const ColorGridApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Color Grid', home: const ColorGridPage());
  }
}

class ColorGridPage extends StatefulWidget {
  const ColorGridPage({Key? key}) : super(key: key);

  @override
  State<ColorGridPage> createState() => _ColorGridPageState();
}

class _ColorGridPageState extends State<ColorGridPage> {
  String _selectedColorName = ""; // 선택된 색상 이름 저장

  final List<Map<String, dynamic>> colorData = [
    {"name": "Green", "color": Colors.green},
    {"name": "Blue", "color": Colors.blue},
    {"name": "Yellow", "color": Colors.yellow},
    {"name": "Orange", "color": Colors.orange},
    {"name": "Purple", "color": Colors.purple},
    {"name": "Pink", "color": Colors.pink},
    {"name": "Teal", "color": Colors.teal},
    {"name": "Brown", "color": Colors.brown},
    {"name": "Cyan", "color": Colors.cyan},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(colorData.length, (index) {
                final color = colorData[index]["color"] as Color;
                final name = colorData[index]["name"] as String;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColorName = name;
                    });
                    _showColorDialog(context, name);
                  },
                  child: Container(
                    color: color,
                    child: Center(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // 선택된 색상 이름 표시
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              _selectedColorName.isEmpty
                  ? "Choose a color"
                  : "Selected color: $_selectedColorName",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  // alert
  void _showColorDialog(BuildContext context, String colorName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selected Color"),
          content: Text("selected: $colorName"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
