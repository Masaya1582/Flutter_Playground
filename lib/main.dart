import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class WaterPipe {
  final StreamController<String> _controller = StreamController<String>();

  Stream<String> get stream => _controller.stream;

  void addMarble(String marble) {
    _controller.sink.add(marble);
  }

  void dispose() {
    _controller.close();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final magicalWaterPipe = WaterPipe(); // Create a magical water pipe

    magicalWaterPipe.addMarble('Red');
    magicalWaterPipe.addMarble('Blue');
    magicalWaterPipe.addMarble('Green');

    return MaterialApp(
      title: 'Stream Magic App',
      home: StreamDemoPage(magicalWaterPipe: magicalWaterPipe),
    );
  }
}

class StreamDemoPage extends StatefulWidget {
  final WaterPipe magicalWaterPipe;

  const StreamDemoPage({Key? key, required this.magicalWaterPipe})
      : super(key: key);

  @override
  _StreamDemoPageState createState() => _StreamDemoPageState();
}

class _StreamDemoPageState extends State<StreamDemoPage> {
  final List<String> receivedMarbles = [];

  @override
  void initState() {
    super.initState();
    final subscription = widget.magicalWaterPipe.stream.listen((marble) {
      setState(() {
        receivedMarbles.add(marble);
      });
    });

    // Cancel the subscription after a while
    Future.delayed(Duration(seconds: 5), () {
      subscription.cancel();
      widget.magicalWaterPipe.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Magic App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Received Marbles:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            for (var marble in receivedMarbles)
              Text(
                marble,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
