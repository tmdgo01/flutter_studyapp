import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'day21color.dart';
import 'day21setting.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day21HomeScreen(),
    ),
  );
}

class Day21HomeScreen extends StatefulWidget {
  const Day21HomeScreen({super.key});

  @override
  State<Day21HomeScreen> createState() => _Day21HomeScreenState();
}

class _Day21HomeScreenState extends State<Day21HomeScreen> {
  List<List<int>> numberGrid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  void shuffleNumbers() {
    final random = Random();
    final randomnum = List.generate(9, (_) => random.nextInt(9) + 1);

    setState(() {
      numberGrid = [
        randomnum.sublist(0, 3),
        randomnum.sublist(3, 6),
        randomnum.sublist(6, 9),
      ];
    });
  }

  void onSettingIconPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const Day21setting(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color5,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(onPressed: onSettingIconPressed),
              NumberImageGrid(numberGrid: numberGrid),
              _BottomButton(onPressed: shuffleNumbers),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final VoidCallback onPressed;

  const Header({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "1~9 RANDOM NUMBER!",
            style: GoogleFonts.cabinSketch(
              textStyle: TextStyle(
                color: Color3,
                fontSize: 35,
                letterSpacing: .5,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: Color3,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class NumberImageGrid extends StatelessWidget {
  final List<List<int>> numberGrid;

  const NumberImageGrid({super.key, required this.numberGrid});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: numberGrid.map((row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((num) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/num/$num.png',
                    width: 80,
                    height: 80,
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _BottomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color3,
          foregroundColor: Color7,
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child: const Text("랜덤 숫자 생성"),
      ),
    );
  }
}
