import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer audioPlayer = AudioPlayer();

  void playLocalAudio() async {
    int result = await audioPlayer.play('assets/audio/sample_sound.mp3');
    if (result == 1) {
      // success
      print('Audio played successfully');
    } else {
      // error
      print('Error playing audio');
    }
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
