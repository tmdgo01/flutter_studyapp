import 'package:flutter/material.dart';

void main(){
  /// 기본 구조
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescreen123(),
    ),
  );
}

class HomeScreen123 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    // Scaffold 는 하나만
    return Scaffold(
      // 0xFF : 16진수 변환
      backgroundColor: Color(0xFF76c6e8),
      // 글자 입력
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/jjang2.jpg'),
          SizedBox(height: 30.0),
          // Image.asset('assets/duffy1.gif'),
          Image.asset('assets/duffy2.gif'),
          // loading gif(?)
          CircularProgressIndicator(color: Colors.black,),
        ],
      ),
    );
  }
}
/// stless : 단축어
class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 80.0,
        ),
      ),
    );
  }
}

class homescreen123 extends StatelessWidget {
  const homescreen123({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          child: Padding(padding:
          EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Container(
              color: Colors.indigo,
              child: Padding(padding: EdgeInsets.fromLTRB(50, 50, 50, 50)),
            ),
          ),
        ),
      )
    );
  }
}

