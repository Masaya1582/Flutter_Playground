import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Text App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedTextScreen(),
    );
  }
}

class AnimatedTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Text Example')),
      body: Center(
        child: TyperAnimatedTextKit(
          text: ['Hello, Flutter!', 'Welcome to Animated Text'],
          textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
