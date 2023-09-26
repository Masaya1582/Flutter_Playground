import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Today's Joke App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokeScreen(),
    );
  }
}

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  String joke = "Press the button to get a joke";

  Future<void> fetchJoke() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/jokes/random"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String setup = data['setup'] ?? "No setup available";
      final String punchline = data['punchline'] ?? "No punchline available";
      setState(() {
        joke = "$setup\n\n$punchline";
      });
    } else {
      setState(() {
        joke = "Failed to load a joke";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Joke"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              joke,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchJoke,
              child: Text("Get Joke"),
            ),
          ],
        ),
      ),
    );
  }
}
