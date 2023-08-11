import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedImageApp());
}

class AnimatedImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Image App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedImageScreen(),
    );
  }
}

class AnimatedImageScreen extends StatefulWidget {
  @override
  _AnimatedImageScreenState createState() => _AnimatedImageScreenState();
}

class _AnimatedImageScreenState extends State<AnimatedImageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Image App')),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            'assets/images/img_donald.jpeg', // Replace with your image asset
            width: 280,
            height: 280,
          ),
        ),
      ),
    );
  }
}
