import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(LinkApp());
}

class LinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _openLink() async {
    const url = 'http://abehiroshi.la.coocan.jp/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Link Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openLink,
          child: Text('Open Link'),
        ),
      ),
    );
  }
}
