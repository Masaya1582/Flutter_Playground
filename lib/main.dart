import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _diceValue = 1;
  bool _isRolling = false;
  Timer? _timer;

  void _rollDice() {
    if (_isRolling) {
      _timer?.cancel();
      _isRolling = false;
      setState(() {
        // Set the button text and background color back to the initial state.
      });
    } else {
      _isRolling = true;
      _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
        setState(() {
          _diceValue = Random().nextInt(6) + 1;
        });
      });
      setState(() {
        // Change the button text and background color while rolling.
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dice$_diceValue.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _rollDice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                primary: _isRolling ? Colors.red : Colors.blue,
              ),
              child: Text(
                _isRolling ? 'Stop Dice' : 'Play Dice',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
