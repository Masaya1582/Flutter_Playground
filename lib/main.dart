import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String jokeSetup = '';
  String jokePunchline = '';

  Future<void> fetchRandomJoke() async {
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      setState(() {
        jokeSetup = decodedResponse['setup'];
        jokePunchline = decodedResponse['punchline'];
      });
    } else {
      // Handle error
      print('Failed to load joke');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Joke'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Setup: $jokeSetup',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Punchline: $jokePunchline',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: fetchRandomJoke,
                child: Text('Get Another Joke'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
