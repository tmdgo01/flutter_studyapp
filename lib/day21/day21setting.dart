import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'day21color.dart';
// TODO : Navigator 사용
class Day21setting extends StatefulWidget {
  const Day21setting({super.key});

  @override
  State<Day21setting> createState() => _Day21settingState();
}

class _Day21settingState extends State<Day21setting> {
  double _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    int currentInt = _currentValue.toInt();
    String numberStr = currentInt.toString();

    return Scaffold(
      backgroundColor: Color5,
      appBar: AppBar(
        title: const Text('숫자 슬라이더'),
        backgroundColor: Color3,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 숫자 자리 수마다 이미지 표시
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: numberStr.split('').map((digit) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(
                    'assets/num/$digit.png',
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 40),

          Slider(
            value: _currentValue,
            min: 1,
            max: 20000,
            divisions: 19999,
            label: currentInt.toString(),
            activeColor: Color3,
            inactiveColor: Color3,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),

          Text(
            '$currentInt',
            style: GoogleFonts.comingSoon(fontSize: 20, color: Color3, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
