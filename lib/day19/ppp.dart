import 'package:flutter/material.dart';
import 'day19a.dart';
import 'day19webview.dart';
import 'day19compose.dart';

// TODO : 아이콘 크기 및 정렬
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeExAd(),
    ),
  );
}


class CoffeExAd extends StatelessWidget {
  const CoffeExAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // 이 부분
        title: Text("COMPOSE COFFEE"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/compose.png',
                  width: 300,
                  height: 300,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Day19Main()));
                  },
                ),
              // 기존 메뉴
              IconButton(
                icon: Image.asset(
                  'assets/A.jpg',
                  fit:BoxFit.contain,
                  width: 250,
                  height: 250,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Day19A()));
                },
              ),
                // Text(' 매일 마시는 아메리카노!'),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 담당 메뉴
                  IconButton(
                    icon: Image.asset('assets/compose_finesunset.png'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Day19FineSunset()));
                    },
                  ),
                  Text("2025 여름이 가면 다신", maxLines: 2,),
                ],
              )
            ],
          ),
        ),
    );
  }
}