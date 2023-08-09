import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

void main() {
  runApp(BounceableApp());
}

class BounceableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bounceable App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BounceableExample(),
    );
  }
}

class BounceableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bounceable Example')),
      body: Center(
        child: Bounceable(
          duration: Duration(milliseconds: 300),
          scaleFactor: 0.5, // Use a valid scaleFactor value between 0.0 and 1.0
          onTap: () {
            print('Button pressed');
          },
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.blue,
            child: Text(
              'Bounce Me!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
