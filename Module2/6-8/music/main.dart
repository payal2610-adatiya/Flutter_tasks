import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player Example',
      home: AudioPlayerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String _statusText = "Music stopped"; 
  @override
  void initState() {
    super.initState();
    _audioPlayer.setAsset('assets/music.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: _isPlaying,
              onChanged: (bool value) {
                setState(() {
                  _isPlaying = value;
                  _statusText = _isPlaying ? "Playing music" : "Music stopped";
                });
                if (_isPlaying) {
                  _audioPlayer.play();
                } else {
                  _audioPlayer.pause();
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              _statusText,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            if(_isPlaying)
              Lottie.asset(
                'assets/music.json',
                width: 200,
                height: 200

              )
          ],
        ),
      ),
    );
  }
}
