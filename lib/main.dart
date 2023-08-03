import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioPath =
      'https://masasophi.com/wp-content/uploads/2023/07/swift.wav';

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    int result = await audioPlayer.play(audioPath,
        isLocal: false); // Set isLocal to false for online audio

    if (result == 1) {
      // Success
      print('Audio is playing');
    } else {
      // Error
      print('Error playing audio');
    }

    audioPlayer.onPlayerCompletion.listen((event) {
      // When audio playback completes
      print('Audio playback completed');
    }, onError: (errorMsg) {
      // If there's an error during playback
      print('Error during audio playback: $errorMsg');
    });
  }

  void stopAudio() async {
    int result = await audioPlayer.stop();

    if (result == 1) {
      // Success
      print('Audio stopped');
    } else {
      // Error
      print('Error stopping audio');
    }
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
            ElevatedButton(
              onPressed: playAudio,
              child: Text('Play Audio'),
            ),
            ElevatedButton(
              onPressed: stopAudio,
              child: Text('Stop Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
