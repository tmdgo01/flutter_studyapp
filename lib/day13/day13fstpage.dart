import 'package:flutter/material.dart';
import 'day13sndpage.dart';

// 첫 번째 페이지
void main() {
  runApp(fstpageapp());
}

class fstpageapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('첫 번째 페이지')),
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () {
                // navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => maindPage()),
                );
              },
              child: Text('메인 화면'),
            ),
          ),
        ),
      ),
    );
  }
}
