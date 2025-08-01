import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

int calculateDaysTogether(DateTime startDate) {
  final now = DateTime.now();

  // 시,분,초 제거
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final today = DateTime(now.year, now.month, now.day);

  final difference = today.difference(start).inDays;

  // 미래 날짜일 경우 0
  return difference < 0 ? 0 : difference + 1;
}


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day20main(),
    ),
  );
}

// 저장
Future<void> saveStartDate(DateTime date) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('startDate', date.toIso8601String());
}

// 불러옴
Future<DateTime?> loadStartDate() async {
  final prefs = await SharedPreferences.getInstance();
  final dateStr = prefs.getString('startDate');
  if (dateStr != null) {
    return DateTime.parse(dateStr);
  }
  return null;
}

class Day20main extends StatefulWidget {
  const Day20main({super.key});

  @override
  State<Day20main> createState() => _Day20mainState();
}

class _Day20mainState extends State<Day20main> {
  DateTime? startDate;

  @override
  void initState() {
    super.initState();
    _loadDate();
  }

  void _loadDate() async {
    DateTime? savedDate = await loadStartDate();
    setState(() {
      startDate = savedDate ?? DateTime(2024, 6, 3);
    });
  }

  void _openDatePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: startDate ?? DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              startDate = newDate;
            });
            saveStartDate(newDate);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int daysTogether = startDate != null ? calculateDaysTogether(startDate!) : 0;
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

          Column(
            children: [
              SizedBox(height: 80),
              Center(
                child:
                Text(
                  "NUKEUN with JUAN",
                  style: GoogleFonts.cabinSketch(
                    textStyle: TextStyle(color: Colors.pink[100], letterSpacing: .5),
                    fontSize: 50,
                  ),
                ),
              ),
              if (startDate != null)
                Text("\n ", style: TextStyle(fontSize: 10),),
                Text(
                  "${startDate!.toLocal()}".split(' ')[0],
                  style: GoogleFonts.comingSoon(
                    textStyle: TextStyle(letterSpacing: .5),
                    fontSize: 20,
                  ),
                ),
              IconButton(
                onPressed: _openDatePicker,
                icon: Icon(Icons.favorite),
                color: Colors.red,
                iconSize: 40,
              ),
              Text(
                "함께한 지 $daysTogether일 째",
                // TODO : 폰트 변경
                style: GoogleFonts.comingSoon(
                  textStyle: TextStyle(letterSpacing: .5),
                  fontSize: 20,
                ),
              ),
            ],
          ),

          Positioned(
            top: 700,
            left: 80,
            child: Text(
              "Here, A Love offering",
              style: GoogleFonts.comingSoon(
                textStyle: TextStyle(
                  color: Color(0xFFf6f7b0),
                  letterSpacing: .5,
                ),
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
