import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette Demo',
      home: RouletteApp(),
    );
  }
}

class RouletteApp extends StatefulWidget {
  RouletteApp({Key? key}) : super(key: key);

  @override
  _RouletteAppState createState() => _RouletteAppState();
}

class _RouletteAppState extends State<RouletteApp> {
  final List<String> imageNameArray = ["img_donald", "img_biden", "img_barack"];
  Timer? timer;
  int changeImageNo = 0;

  String get currentImage => imageNameArray[changeImageNo];

  void updateImage() {
    changeImageNo = (changeImageNo + 1) % imageNameArray.length;
  }

  void updateTimer(Timer timer) {
    setState(() {
      updateImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace this with your actual image widget
            Image.asset('assets/images/$currentImage.jpeg'),
            ElevatedButton(
              onPressed: () {
                if (timer == null) {
                  timer =
                      Timer.periodic(Duration(milliseconds: 100), updateTimer);
                  setState(() {});
                } else {
                  timer!.cancel();
                  timer = null;
                  setState(() {});
                }
              },
              child: Text(timer == null ? 'Start' : 'Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
