import 'package:flutter/material.dart';

void main() {
  runApp(ActivityIndicatorApp());
}

class ActivityIndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Indicator App',
      home: ActivityIndicatorScreen(),
    );
  }
}

class ActivityIndicatorScreen extends StatefulWidget {
  @override
  _ActivityIndicatorScreenState createState() =>
      _ActivityIndicatorScreenState();
}

class _ActivityIndicatorScreenState extends State<ActivityIndicatorScreen> {
  bool _showActivityIndicator = false;

  void _toggleActivityIndicator() {
    setState(() {
      _showActivityIndicator = !_showActivityIndicator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Indicator App'),
      ),
      body: Center(
        child: _showActivityIndicator
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _toggleActivityIndicator,
                child: Text('Show Activity Indicator'),
              ),
      ),
    );
  }
}
