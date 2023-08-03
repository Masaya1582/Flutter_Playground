import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  void playLocalAudio() {
    audioPlayer.open(Audio('assets/audio/sample_sound.mp3')).then((_) {
      // Audio played successfully
      print('Audio played successfully');
    }).catchError((error) {
      // Error playing audio
      print('Error playing audio: $error');
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Release the resources used by the audio player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Audio Player'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            playLocalAudio();
          },
          child: Text('Play Audio'),
        ),
      ),
    );
  }
}
