import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Half Modal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showHalfModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set this to true
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5, // Set the height factor you desire
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Half Modal Content',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Half Modal App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showHalfModal(context);
          },
          child: Text('Show Half Modal'),
        ),
      ),
    );
  }
}
