import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EmailValidatorApp());
}

class EmailValidatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email Validator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailValidatorScreen(),
    );
  }
}

class EmailValidatorScreen extends StatefulWidget {
  @override
  _EmailValidatorScreenState createState() => _EmailValidatorScreenState();
}

class _EmailValidatorScreenState extends State<EmailValidatorScreen> {
  final _emailController = TextEditingController();
  bool _isValid = false;

  void _validateEmail() {
    final email = _emailController.text;

    setState(() {
      _isValid = EmailValidator.validate(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Enter your email',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _validateEmail,
              child: Text('Validate Email'),
            ),
            SizedBox(height: 16),
            Text(
              _isValid ? 'Email is valid!' : 'Email is not valid.',
              style: TextStyle(
                color: _isValid ? Colors.green : Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
