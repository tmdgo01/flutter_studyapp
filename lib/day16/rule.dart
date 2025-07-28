import 'package:flutter/material.dart';

void main(){
  /// 기본 구조
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // 글자 입력
        backgroundColor: Colors.white60,
        body:
        Center(
          child: Text(
            "aa",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 55,
            ),
          ),
        ),
      ),
    ),
  );
}