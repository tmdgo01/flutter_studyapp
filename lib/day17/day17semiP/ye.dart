import 'package:flutter/material.dart';

class yeme extends StatelessWidget {
  const yeme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('영화예매하기')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('해리포터와 마법사의 돌'),
          SizedBox(height: 50),
          Image.asset('assets/img/h1.webp'),
        ],
      ),
    );
  }
}
