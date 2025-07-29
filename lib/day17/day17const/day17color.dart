import 'package:flutter/material.dart';

/// 색상 변수를 리스트 형태로 생성
// const colors = [
//   Colors.indigo,
//   Colors.amberAccent,
//   Colors.deepPurple,
//   Colors.lightGreen,
// ];

final colors = [
  Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/123.png'),),),),
  Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/123.png'),),),),
  Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/123.png'),),),),
  Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/123.png'),),),),
];

const day17loading = [
  CircularProgressIndicator(color: Colors.indigo,),
  CircularProgressIndicator(color: Colors.amberAccent,),
  CircularProgressIndicator(color: Colors.deepPurple,),
  CircularProgressIndicator(color: Colors.lightGreen,),
];

List day17chessloop() {
  const board = [];
  for (int i = 1; i <= 8; i++){
    for (int j = 1; i <= 8; i++){
      if ((i + j) % 2 == 0){ // 흰
        board.add(Colors.white);
      } else{ // 검
        board.add(Colors.black);
      }
    }
  }
  return board;
}
