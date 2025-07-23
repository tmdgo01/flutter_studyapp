// listview(listtile 이용)
// 버스 시간표, 영화 목록, 음악 재생 목록 등 스크롤

// gridview
// 사진 앨범, 상품 목록 등

// singlechildscrollview
// 긴 텍스트, 긴 이미지 등 스크롤

// pageview
// 페이지 전환, 이미지 슬라이드

// tabbar
// 탭 메뉴, 카테고리별 콘텐츠

// listwheelscrollview
// 무한 스크롤, 회전하는 리스트

// dissmissible
// 스와이프하여 삭제, 완료 표시 등

// secondaryscrollview
// 스크롤 가능한 위젯을 다른 스크롤 가능한 위젯 안에

// reorderable
// 리스트 재정렬, 드래그 앤 드롭

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView & GridView')),
        body: Column(
          children: [
            Expanded(child: MyListView()),
            Expanded(child: MyGridView()),
            Expanded(child: MySingleChildScrollView()),
            Expanded(child: MyPageView()),
            Expanded(child: MyTabBar()),
            Expanded(child: MyListWheelScrollView()),
            Expanded(child: MyDismissible()),
            Expanded(child: MySecondaryScrollView()),
            Expanded(child: MyReorderableListView()),
          ],
        ),
      ),
    );
  }
}

class mystatefulwidget extends StatefulWidget {
  const mystatefulwidget({Key? key}) : super(key: key);

  @override
  State<mystatefulwidget> createState() => _mystatefulwidgetState();
}

class _mystatefulwidgetState extends State<mystatefulwidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Item $index'));
      },
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(child: Center(child: Text('Item $index')));
      },
    );
  }
}

class MySingleChildScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) => Text('Item $index')),
      ),
    );
  }
}

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: List.generate(5, (index) => Center(child: Text('Page $index'))),
    );
  }
}

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
          ],
        ),
      ),
    );
  }
}

class MyListWheelScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 50,
      children: List.generate(20, (index) => Text('Item $index')),
    );
  }
}

class MyDismissible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('dismissible'),
      onDismissed: (direction) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Item dismissed')));
      },
      child: ListTile(title: Text('Swipe to dismiss')),
    );
  }
}

class MySecondaryScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('This is a secondary scroll view'),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Secondary Item $index'));
            },
          ),
        ],
      ),
    );
  }
}

class MyReorderableListView extends StatefulWidget {
  @override
  _MyReorderableListViewState createState() => _MyReorderableListViewState();
}

class _MyReorderableListViewState extends State<MyReorderableListView> {
  List<String> _items = List.generate(10, (index) => 'reorderable $index');

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: _items
          .asMap()
          .entries
          .map(
            (entry) =>
                ListTile(key: ValueKey(entry.key), title: Text(entry.value)),
          )
          .toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
