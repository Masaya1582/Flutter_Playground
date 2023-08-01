import 'package:flutter/material.dart';

void main() {
  runApp(ImageViewerApp());
}

class ImageViewerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Donald Trump'),
        ),
        body: Center(
          child: Image.asset('assets/images/img_donald.jpeg'),
        ),
      ),
    );
  }
}
