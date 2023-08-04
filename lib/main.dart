import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ContentView(),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  int randomNumber = 1;
  Timer? timer;
  bool isRolling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/dice$randomNumber.png', // Make sure to add images named "die_face_1.png", "die_face_2.png", etc. to the "assets" folder of your project.
              width: MediaQuery.of(context).size.width / 2,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: isRolling ? null : playDice,
              child: Text("サイコロを振る"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void playDice() {
    print("ボタンが押されたよ");
    setState(() {
      isRolling = true;
    });
    timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {
        randomNumber = Random().nextInt(6) + 1;
      });
    });
    Future.delayed(Duration(milliseconds: 500), () {
      timer?.cancel();
      setState(() {
        isRolling = false;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
