// 첫 번째 탭의 메인 화면에 2 * 2 그리드 뷰를 생성
// 각 부분에 elevatedbutton 생성
// 생성한 각 버튼은 다음 페이지로 이동
// 왼쪽 상단(lib/day11/day11mul.dart), 오른쪽 상단(lib/day13/day13hotelbook.dart),
// 왼쪽 하단(day14lib.dart), 오른쪽 하단(lib/day11/day11calc.dart)으로 이동

// 두 번째 탭에 각 버튼(OutLinedButton)을 세로로 배치(for 문)
// 각 버튼은 다음 페이지로 이동
// List list = [https://untitled628.tistory.com/599, https://github.com/tmdgo01, https://www.youtube.com/@pray94, https://www.kakao.com/policy/terms]

import 'package:flutter/material.dart';

import '/day11/day11mul.dart';
import '/day13/day13hotelbook.dart';
import '/day14/day14lib.dart';
import '/day11/day11calc.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Grid View'),
              Tab(text: 'List View'),
            ],
          ),
        ),
        body: const TabBarView(children: [GridViewPage(), ListViewPage()]),
      ),
    );
  }
}

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => day11mul()),
            );
          },
          child: const Text('Day 11 Mul'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Day13HotelBookApp()),
            );
          },
          child: const Text('Day 13 Hotel Book'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LibexApp()),
            );
          },
          child: const Text('Day 14 Lib'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => day11clacapp()),
            );
          },
          child: const Text('Day 11 Calc'),
        ),
      ],
    );
  }
}

final List<Uri> _urls = [
  Uri.parse('https://untitled628.tistory.com/599'),
  Uri.parse('https://github.com/tmdgo01'),
  Uri.parse('https://www.youtube.com/@pray94'),
  Uri.parse('https://www.kakao.com/policy/terms'),
];

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await canLaunchUrl(url)) {
      throw Exception('Could not launch $url');
    }
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _urls.length,
      itemBuilder: (context, index) {
        return OutlinedButton(
          onPressed: () async {
            try {
              await _launchUrl(_urls[index]);
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.toString())));
            }
          },
          child: Text('Link ${index + 1}'),
        );
      },
    );
  }
}
