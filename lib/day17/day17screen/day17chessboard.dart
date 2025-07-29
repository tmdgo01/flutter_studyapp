import 'package:flutter/material.dart';

class day17chessboard extends StatelessWidget {
  const day17chessboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
            children: [

            ],
          )
      ),
    );
  }
}

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: day17chessboard()
    ),
  );
}