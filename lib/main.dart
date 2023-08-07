import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MusicPlayerApp());
}

class Song {
  final String title;
  final String artist;
  final String audioUrl;

  Song({required this.title, required this.artist, required this.audioUrl});
}

List<Song> songs = [
  Song(
      title: 'Song 1',
      artist: 'Artist 1',
      audioUrl:
          'https://masasophi.com/wp-content/uploads/2023/08/Kokage_De_Yuttari-2Fast.mp3'),
  Song(
      title: 'Song 2',
      artist: 'Artist 2',
      audioUrl:
          'https://masasophi.com/wp-content/uploads/2023/08/flutter_zundamon.wav'),
  // Add more songs
];

class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicPlayerHome(),
    );
  }
}

class MusicPlayerHome extends StatefulWidget {
  @override
  _MusicPlayerHomeState createState() => _MusicPlayerHomeState();
}

class _MusicPlayerHomeState extends State<MusicPlayerHome> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int currentIndex = 0;

  void playSong(String audioUrl) async {
    await audioPlayer.stop();
    await audioPlayer.play(audioUrl);
    setState(() {
      isPlaying = true;
    });
  }

  void pauseSong() async {
    await audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void skipToNextSong() async {
    if (currentIndex < songs.length - 1) {
      currentIndex++;
      await audioPlayer.stop();
      await audioPlayer.play(songs[currentIndex].audioUrl);
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Player App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              songs[currentIndex].title,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              songs[currentIndex].artist,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    setState(() {
                      if (currentIndex > 0) {
                        currentIndex--;
                        playSong(songs[currentIndex].audioUrl);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  onPressed: () {
                    if (isPlaying) {
                      pauseSong();
                    } else {
                      playSong(songs[currentIndex].audioUrl);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: skipToNextSong,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
