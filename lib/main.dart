import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spinner App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SpinnerScreen(),
    );
  }
}

class SpinnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spinner Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRotatingCircle(color: Colors.blue),
            SizedBox(height: 20),
            SpinKitChasingDots(color: Colors.red),
            SizedBox(height: 20),
            SpinKitThreeBounce(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
