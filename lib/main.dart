import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  final numbersStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  final transformedStream = numbersStream.map((number) => number * 2);

  final filteredStream = transformedStream.where((number) => number > 5);

  filteredStream.listen((number) {
    print('Received number: $number');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
