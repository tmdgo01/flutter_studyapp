import 'package:flutter/material.dart';

// 1단 ~ 9단까지 버튼을 만들고(3*3 배열)
// 버튼을 누르면 해당 단의 구구단을 alertDialog로 보여주는 앱
class day11mul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'multiplication',
      home: Scaffold(
        appBar: AppBar(title: const Text('구구단'), centerTitle: true),
        body: SafeArea(
          child: Column(
            children: List.generate(3, (rowIndex) {
              return Expanded(
                child: Row(
                  children: List.generate(3, (colIndex) {
                    int dan = rowIndex * 3 + colIndex + 1;
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              _showGugudanDialog(context, dan);
                            },
                            child: Text('$dan단'),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _showGugudanDialog(BuildContext context, int dan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$dan단'),
          content: SingleChildScrollView(
            child: ListBody(
              children: List.generate(9, (i) {
                int num = i + 1;
                return Text('$dan × $num = ${dan * num}');
              }),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(day11mul());
}
