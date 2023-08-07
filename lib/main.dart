import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(PasswordGeneratorApp());
}

class PasswordGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PasswordGeneratorScreen(),
    );
  }
}

class PasswordGeneratorScreen extends StatefulWidget {
  @override
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  String _generatedPassword = '';

  void _generatePassword(
      int length, bool useUppercase, bool useNumbers, bool useSpecial) {
    final String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    final String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final String numberChars = '0123456789';
    final String specialChars = '!@#\$%^&*()_+';

    String allChars = lowercaseChars;
    if (useUppercase) allChars += uppercaseChars;
    if (useNumbers) allChars += numberChars;
    if (useSpecial) allChars += specialChars;

    final Random random = Random();
    final StringBuffer password = StringBuffer();

    for (int i = 0; i < length; i++) {
      password.write(allChars[random.nextInt(allChars.length)]);
    }

    setState(() {
      _generatedPassword = password.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password Generator')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Generated Password:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SelectableText(_generatedPassword, style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _generatePassword(
                    12, true, true, true); // Default length and options
              },
              child: Text('Generate Password'),
            ),
          ],
        ),
      ),
    );
  }
}
