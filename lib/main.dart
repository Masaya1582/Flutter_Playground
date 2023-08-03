import 'package:flutter/material.dart';

void main() => runApp(FlipAnimationApp());

class FlipAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlipAnimationScreen(),
    );
  }
}

class FlipAnimationScreen extends StatefulWidget {
  @override
  _FlipAnimationScreenState createState() => _FlipAnimationScreenState();
}

class _FlipAnimationScreenState extends State<FlipAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip Animation App'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final double rotationValue = _isFront
                ? 3.141592 * _controller.value
                : 3.141592 * (1 - _controller.value);
            return GestureDetector(
              onTap: _flipCard,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(rotationValue),
                alignment: Alignment.center,
                child: _isFront ? _FrontCard() : _BackCard(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FrontCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Front',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

class _BackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Center(
        child: Text(
          'Back',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
