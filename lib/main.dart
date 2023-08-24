import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(RouletteApp());
}

class RouletteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouletteScreen(),
    );
  }
}

class RouletteScreen extends StatefulWidget {
  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  final List<String> colors = ['Red', 'Black', 'Green'];
  Random random = Random();
  String resultColor = '';
  bool spinning = false;

  void spinRouletteWheel() {
    setState(() {
      spinning = true;
      resultColor = '';
    });

    Future.delayed(Duration(seconds: 2), () {
      int randomNumber = random.nextInt(37);
      resultColor = randomNumber == 0
          ? 'Green'
          : randomNumber % 2 == 0
              ? 'Black'
              : 'Red';

      setState(() {
        spinning = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Roulette'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            spinning
                ? CircularProgressIndicator()
                : Text(
                    'Result Color: $resultColor',
                    style: TextStyle(fontSize: 24),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: spinning ? null : spinRouletteWheel,
              child: Text('Spin the Wheel'),
            ),
          ],
        ),
      ),
    );
  }
}
