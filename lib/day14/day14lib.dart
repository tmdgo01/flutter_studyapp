import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

final Uri _url = Uri.parse('https://www.youtube.com/@pray94');

void main() => runApp(const MaterialApp(home: LibexApp()));

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class LibexApp extends StatefulWidget {
  const LibexApp({super.key});

  @override
  State<LibexApp> createState() => _LibexAppState();
}

class _LibexAppState extends State<LibexApp> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _launchUrl,
              child: Text(
                'Lets go Pray',
                style: GoogleFonts.roboto(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          const SizedBox(height: 20),
          PlayerWidget(player: _player),
        ],
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;

  const PlayerWidget({required this.player, super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final String _urlAudio1 =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  final String _urlAudio2 =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';

  final String _assetAudio = '2.mp3';

  final String _frozenVideo = "Frozen-360p.mp4";

  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSub;
  StreamSubscription? _positionSub;
  StreamSubscription? _completeSub;
  StreamSubscription? _stateSub;

  bool get _isPlaying => _playerState == PlayerState.playing;
  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';

  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();

    _playerState = player.state;

    _durationSub = player.onDurationChanged.listen((d) {
      if (mounted) setState(() => _duration = d);
    });

    _positionSub = player.onPositionChanged.listen((p) {
      if (mounted) setState(() => _position = p);
    });

    _completeSub = player.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _playerState = PlayerState.stopped;
          _position = Duration.zero;
        });
      }
    });

    _stateSub = player.onPlayerStateChanged.listen((s) {
      if (mounted) setState(() => _playerState = s);
    });
  }

  @override
  void dispose() {
    _durationSub?.cancel();
    _positionSub?.cancel();
    _completeSub?.cancel();
    _stateSub?.cancel();
    super.dispose();
  }

  Future<void> _playLocal() async {
    try {
      await player.stop();
      await player.setSource(AssetSource(_assetAudio));
      await player.resume();
    } catch (e) {
      _showError('로컬 오디오 재생 실패: $e');
    }
  }

  Future<void> _playUrl1() async {
    try {
      await player.stop();
      await player.play(UrlSource(_urlAudio1));
    } catch (e) {
      _showError('URL 오디오 재생 실패: $e');
    }
  }

  Future<void> _playUrl2() async {
    try {
      await player.stop();
      await player.play(UrlSource(_urlAudio2));
    } catch (e) {
      _showError('URL 오디오 재생 실패: $e');
    }
  }

  Future<void> _pause() async {
    await player.pause();
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() => _position = Duration.zero);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: !_isPlaying ? _playLocal : null,
              icon: const Icon(Icons.music_note),
              tooltip: '로컬 오디오 재생',
              iconSize: 36,
              color: Colors.deepPurpleAccent,
            ),
            IconButton(
              onPressed: !_isPlaying ? _playUrl1 : null,
              icon: const Icon(Icons.cloud),
              tooltip: 'URL 오디오 1 재생',
              iconSize: 36,
              color: Colors.indigo,
            ),
            IconButton(
              onPressed: !_isPlaying ? _playUrl2 : null,
              icon: const Icon(Icons.cloud),
              tooltip: 'URL 오디오 2 재생',
              iconSize: 36,
              color: Colors.blueAccent,
            ),
            IconButton(
              onPressed: _isPlaying ? _pause : null,
              icon: const Icon(Icons.pause),
              tooltip: '일시정지',
              iconSize: 36,
              color: color,
            ),
            IconButton(
              onPressed: _isPlaying || _isPaused ? _stop : null,
              icon: const Icon(Icons.stop),
              tooltip: '정지',
              iconSize: 36,
              color: Colors.red,
            ),
            IconButton(
              onPressed: () async {
                try {
                  await player.setSource(AssetSource(_frozenVideo));
                  await player.resume();
                } catch (e) {
                  _showError('비디오 재생 실패: $e');
                }
              },
              icon: const Icon(Icons.video_library),
              tooltip: '비디오 재생',
              iconSize: 36,
              color: Colors.green,
            ),
          ],
        ),
        Slider(
          onChanged: (value) {
            final duration = _duration;
            if (duration == null) return;
            final position = value * duration.inMilliseconds;
            player.seek(Duration(milliseconds: position.round()));
          },
          value:
              (_position != null &&
                  _duration != null &&
                  _position!.inMilliseconds > 0 &&
                  _position!.inMilliseconds < _duration!.inMilliseconds)
              ? _position!.inMilliseconds / _duration!.inMilliseconds
              : 0.0,
        ),
        Text(
          _position != null ? '$_positionText / $_durationText' : _durationText,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
