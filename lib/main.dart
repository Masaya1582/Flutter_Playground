import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MentalArithmeticApp());
}

class MentalArithmeticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Arithmetic App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MentalArithmeticScreen(),
    );
  }
}

class MentalArithmeticScreen extends StatefulWidget {
  @override
  _MentalArithmeticScreenState createState() => _MentalArithmeticScreenState();
}

class _MentalArithmeticScreenState extends State<MentalArithmeticScreen> {
  int _num1 = 0;
  int _num2 = 0;
  int _result = 0;
  String _operator = '+';
  bool _showResult = false;

  void _generateNumbers() {
    final random = Random();
    _num1 = random.nextInt(100);
    _num2 = random.nextInt(100);
    _operator = ['+', '-', '*', '/'][random.nextInt(4)];
    _showResult = false;

    switch (_operator) {
      case '+':
        _result = _num1 + _num2;
        break;
      case '-':
        _result = _num1 - _num2;
        break;
      case '*':
        _result = _num1 * _num2;
        break;
      case '/':
        _result = _num1 ~/ _num2; // Ensure result is an integer
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mental Arithmetic App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_num1 $_operator $_num2',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            _showResult
                ? Text(
                    '$_result',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showResult = true;
                      });
                    },
                    child: Text('Show Result'),
                  ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _generateNumbers();
                });
              },
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}
