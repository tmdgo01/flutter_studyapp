import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int calculateDaysTogether(DateTime startDate) {
  final now = DateTime.now();

  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final today = DateTime(now.year, now.month, now.day);

  final difference = today.difference(start).inDays;
  return difference < 0 ? 0 : difference + 1;
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day20Main(),
    ),
  );
}

class Day20Main extends StatefulWidget {
  const Day20Main({super.key});

  @override
  State<Day20Main> createState() => _Day20MainState();
}

class _Day20MainState extends State<Day20Main> {
  // 시작 날짜 고정
  final DateTime startDate = DateTime(2024, 6, 3);

  @override
  Widget build(BuildContext context) {
    final int daysTogether = calculateDaysTogether(startDate);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Center(
              child: Image.asset(
                'assets/hanyuri_modify.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  "NUKEUN with JUAN",
                  style: GoogleFonts.cabinSketch(
                    textStyle: TextStyle(
                      color: Colors.pink[100],
                      letterSpacing: 0.5,
                    ),
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "2024. 06. 03",
                  style: GoogleFonts.comingSoon(
                    textStyle: const TextStyle(letterSpacing: 0.5),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(Icons.favorite, color: Colors.red,),
                const SizedBox(height: 10),
                Text(
                  "함께한 지 $daysTogether일 째",
                  style: GoogleFonts.gaegu(
                    textStyle: const TextStyle(letterSpacing: 0.5),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 700,
            left: 80,
            child: Text(
              "Here, A Love offering",
              style: GoogleFonts.comingSoon(
                color: const Color(0xFFf6f7b0),
                letterSpacing: 0.5,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
