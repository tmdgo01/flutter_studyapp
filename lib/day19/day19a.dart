// day 19a.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 메인 파일 변경
import 'ppp.dart';

// url 변경
final composeurl = Uri.parse("https://composecoffee.com/menu/97253");

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // 메인 파일 실행 home
      home: Day19A(),
    ),
  );
}

class Day19A extends StatelessWidget {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(composeurl);

  Day19A({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // 이 부분
        title: Text("Americano"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CoffeExAd(),),);},
            icon: const Icon(Icons.home_max_outlined),
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
