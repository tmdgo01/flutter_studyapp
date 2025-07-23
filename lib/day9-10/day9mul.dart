import 'package:flutter/material.dart';

void main() {
  runApp(day9mul());
}

class day9mul extends StatelessWidget {
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$dan단',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              ...List.generate(9, (i) {
                                int num = i + 1;
                                return Text(
                                  '$dan × $num = ${dan * num}',
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                );
                              }),
                            ],
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
}
