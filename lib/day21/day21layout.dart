import 'package:flutter/material.dart';
import 'dart:math';
import 'day21color.dart';

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
    final numbers = List.generate(9, (index) => index + 1)..shuffle(Random());

    setState(() {
      numberGrid = [
        numbers.sublist(0, 3),
        numbers.sublist(3, 6),
        numbers.sublist(6, 9),
      ];
    });
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
              const Header(),
              NumberImageGrid(numberGrid: numberGrid),
              const SizedBox(height: 16),
              BottomButton(onPressed: shuffleNumbers),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "랜덤 숫자 생성!",
            style: TextStyle(
              color: Color3,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: Color3,
            onPressed: () {
              // 설정 버튼 동작 (추후 구현 가능)
            },
          ),
        ],
      ),
    );
  }
}

// 숫자 이미지 3x3 그리드
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
                    width: 50,
                    height: 50,
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

// 하단 버튼 위젯
class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BottomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color3,
        foregroundColor: Color7,
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: const Text("랜덤 숫자 생성"),
    );
  }
}
