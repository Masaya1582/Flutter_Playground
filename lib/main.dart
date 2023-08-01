import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  bool _isRunning = false; // Keeps track of whether the stopwatch is running or paused.
  int _elapsedTime = 0; // Keeps track of the elapsed time in milliseconds.

  // Method to start the stopwatch.
  void _startStopwatch() {
    setState(() {
      _isRunning = true; // Set the _isRunning flag to true to indicate that the stopwatch is running.
      _elapsedTime = 0; // Reset the elapsed time to 0.
    });

    // Start the stopwatch by creating a periodic Timer that updates the elapsed time every 10 milliseconds.
    const duration = Duration(milliseconds: 10);
    Timer.periodic(duration, (Timer timer) {
      // The callback function of the Timer runs every 10 milliseconds while the stopwatch is running.
      if (!_isRunning) {
        // If the stopwatch is no longer running (paused or reset), cancel the Timer to stop it.
        timer.cancel();
        return;
      }
      setState(() {
        // Increment the _elapsedTime by 10 milliseconds to keep track of the running time.
        _elapsedTime += 10;
      });
    });
  }

  // Method to stop the stopwatch.
  void _stopStopwatch() {
    setState(() {
      _isRunning = false; // Set the _isRunning flag to false to indicate that the stopwatch is paused.
    });
  }

  // Method to reset the stopwatch.
  void _resetStopwatch() {
    setState(() {
      _isRunning = false; // Set the _isRunning flag to false to indicate that the stopwatch is reset.
      _elapsedTime = 0; // Reset the elapsed time to 0.
    });
  }

  // Method to format the elapsed time into a human-readable string (mm:ss.SS).
  String _formatTime(int milliseconds) {
    int minutes = (milliseconds ~/ 60000) % 60; // Calculate the minutes.
    int seconds = (milliseconds ~/ 1000) % 60; // Calculate the seconds.
    int millisecondsRemaining = milliseconds % 1000; // Calculate the remaining milliseconds.

    // Return the formatted time string in the format "mm:ss.SS".
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${(millisecondsRemaining ~/ 10).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stopwatch App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the formatted elapsed time in a large font.
              Text(
                _formatTime(_elapsedTime),
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 20),
              // Buttons to start, stop, and reset the stopwatch.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isRunning ? _stopStopwatch : _startStopwatch,
                    child: Text(_isRunning ? 'Stop' : 'Start'), // Display "Stop" when running, "Start" when not running.
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _resetStopwatch,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}