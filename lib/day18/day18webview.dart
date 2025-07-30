import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeurl = Uri.parse("https://www.youtube.com/@pray94");

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day18Screen(),
    ),
  );
}

class Day18Screen extends StatelessWidget {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(homeurl);

  Day18Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Pray94 Youtube"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => day18home(),),);},
        icon: const Icon(Icons.home_max_outlined),
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

class day18home extends StatelessWidget {
  const day18home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HOME"),
    );
  }
}
