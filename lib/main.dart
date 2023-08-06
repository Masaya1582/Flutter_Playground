import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(RandomNumberGeneratorApp());
}

class RandomNumberGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomNumberGeneratorScreen(),
    );
  }
}

class RandomNumberGeneratorScreen extends StatefulWidget {
  @override
  _RandomNumberGeneratorScreenState createState() =>
      _RandomNumberGeneratorScreenState();
}

class _RandomNumberGeneratorScreenState
    extends State<RandomNumberGeneratorScreen> {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  String randomNumber = "";

  void generateRandomNumber() {
    int min = int.tryParse(minController.text) ?? 0;
    int max = int.tryParse(maxController.text) ?? 0;

    if (min < max) {
      Random random = Random();
      int result = min + random.nextInt(max - min + 1);
      setState(() {
        randomNumber = result.toString();
      });
    } else {
      setState(() {
        randomNumber = "Invalid Range";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: minController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Min Value',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: maxController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Max Value',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: generateRandomNumber,
              child: Text('Generate Random Number'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Random Number: $randomNumber',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
