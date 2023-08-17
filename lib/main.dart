import 'package:flutter/material.dart';

void main() {
  print("Welcome to the Weather App!");

  fetchWeather().then((weather) {
    print("Today's weather: $weather");
  });

  print("Fetching weather information...");
}

Future<String> fetchWeather() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Sunny";
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
