import 'package:flutter/material.dart';
import 'day19a.dart';
import 'day19webview.dart';
import 'day19compose.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: CoffeExAd(),
    ),
  );
}


class CoffeExAd extends StatelessWidget {
  const CoffeExAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
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
                Row(
                  children: <Widget>[
                    Column(
                      children: [
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
                        ), Text('매일 마시는 아메리카노!'),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 담당 메뉴
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 40, 50, 30),
                            child: IconButton(
                              icon: Image.asset('assets/compose_finesunset.png',
                                fit:BoxFit.contain,
                                width: 185,
                                height: 185,),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Day19FineSunset()));
                              },
                            ),
                          ),
                          Text("2025 여름이 가면\n다신 못 보는 음료~!", maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    )
                  ],
                ),
                // 기존 메뉴
              ],
            ),
          ),
        ),
    );
  }
}