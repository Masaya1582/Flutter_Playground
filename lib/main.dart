import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _secondsLeft = 0;
  bool _isRunning = false;

  void _startCountdown(int seconds) async {
    setState(() {
      _secondsLeft = seconds;
      _isRunning = true;
    });

    while (_secondsLeft > 0) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _secondsLeft--;
      });
    }

    setState(() {
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_secondsLeft seconds left',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            _isRunning
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (!_isRunning) {
                        _startCountdown(10); // Set the countdown time here
                      }
                    },
                    child: Text('Start Countdown'),
                  ),
          ],
        ),
      ),
    );
  }
}
