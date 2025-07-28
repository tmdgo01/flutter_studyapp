import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeMp4 extends StatefulWidget {
  const HomeMp4({super.key});

  @override
  State<HomeMp4> createState() => _HomeMp4State();
}

class _HomeMp4State extends State<HomeMp4> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Frozen-360p.mp4');

    _controller.addListener(() {
      setState(() {}); // UI 갱신
    });

    _controller.setLooping(true);
    _controller.initialize().then((_) {
      setState(() {}); // 초기화 후 갱신
      _controller.play(); // 자동 재생
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // 자원 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Player")),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
