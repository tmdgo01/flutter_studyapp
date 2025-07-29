import 'package:flutter/material.dart';
import 'ye.dart';
import 'reservation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("영화 예매 - 해리포터 시리즈", style: TextStyle(fontSize: 20)),
              // 해리포터 1 container
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('1.'),
                        Image.asset(
                          'assets/harrypotter1.png',
                          fit: BoxFit.contain,
                          width: 170,
                          height: 170,
                        ),

                        Text('해리포터와 마법사의 돌'),
                        ElevatedButton(onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>yeme()));
                        }, child: Text('예매')),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text("1시")),
                        ElevatedButton(onPressed: () {}, child: Text("3시")),
                        ElevatedButton(onPressed: () {}, child: Text("5시")),
                      ],
                    ),
                  ],
                ),
              ),

              // 해리포터 2 container
              Container(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("2", style: TextStyle(fontSize: 20.0),),
                        Image.asset('assets/harrypotter2.png',
                          fit: BoxFit.contain,
                          width: 170.0,
                          height: 170.0,),
                        Text("해리포터와 비밀의 방",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute
                            (builder: (BuildContext context) {
                            return reservation();
                          },
                          ),
                          );
                        },
                          child:  Text("예매"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 해리포터 3 container
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                  itemCount: harryPotterList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 200,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            harryPotterList[index].imageUrl,
                            width: 150,
                          ),
                          SizedBox(width: 20),
                          Text(harryPotterList[index].title),
                          ElevatedButton(
                              onPressed:(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HarryPotter3Page()
                                    )
                                );
                              },
                              child: const Text("예매"))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HarryPotter {
  const HarryPotter(this.imageUrl, this.title);
  final String imageUrl;
  final String title;
}

const harryPotterList = [
  HarryPotter("assets/harrypotter3.png", "해리포터 3"),
];

class HarryPotter3Page extends StatelessWidget {
  const HarryPotter3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  children: [
                    Text("해리포터 3"),
                    Container(
                      width: 300,
                      height: 500,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/harrypotter3.png'),),),
                    ),Text("개봉일: 2004년 7월 16일 (대한민국)\n 감독: 알폰소 쿠아론\n 속편: 해리 포터와 불의 잔 \n 전편: 해리 포터와 비밀의 방",)
                  ]
              )
            ],
          )
        ],
      ),
      ),
    );
  }
}

class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('1.'),
                Image.asset(
                  'assets/harrypotter1.png',
                  fit: BoxFit.contain,
                  width: 170,
                  height: 170,
                ),

                Text('해리포터와 마법사의 돌'),
                ElevatedButton(onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>yeme()));
                }, child: Text('예매')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("1시")),
                ElevatedButton(onPressed: () {}, child: Text("3시")),
                ElevatedButton(onPressed: () {}, child: Text("5시")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
