import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceRollerApp());
}

class DiceRollerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DiceRollerScreen(),
    );
  }
}

class DiceRollerScreen extends StatefulWidget {
  @override
  _DiceRollerScreenState createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  int _dice1 = 1;
  int _dice2 = 1;
  bool _rolling = false;

  void _rollDice() {
    if (!_rolling) {
      _rolling = true;
      final random = Random();
      Timer? rollingTimer;

      rollingTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          _dice1 = random.nextInt(6) + 1;
          _dice2 = random.nextInt(6) + 1;
        });

        if (!_rolling) {
          rollingTimer?.cancel();
          setState(() {
            // Optional: Generate a random number again to simulate the final result
            _dice1 = random.nextInt(6) + 1;
            _dice2 = random.nextInt(6) + 1;
          });
        }
      });

      Timer(Duration(seconds: 1), () {
        setState(() {
          _rolling = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice Roller App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDice(_dice1),
                SizedBox(width: 16),
                _buildDice(_dice2),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _rolling ? null : _rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDice(int value) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
