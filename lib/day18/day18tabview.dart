import 'package:flutter/material.dart';

import '../day13/day13hotelbook.dart';
import '../day17/day17semiP/day17semiP.dart';
import 'day18webview.dart';

final pray94url = Uri.parse("https://www.youtube.com/@pray94");

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Day18HomePage(),)
  );
}

class Day18HomePage extends StatelessWidget {
  const Day18HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
            bottom: const TabBar(
                tabs: [
                  Tab(text: "Pray94 Youtube"),
                  Tab(text: "Book Movie"),
                  Tab(text: "Book Hotel",),
                ],
            ),
          ),
          body: TabBarView(children: [Day18Screen(), MovieApp(), Day13HotelBookApp(),],),
    )
    );
  }
}

