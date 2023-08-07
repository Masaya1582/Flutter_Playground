import 'package:flutter/material.dart';

void main() {
  runApp(QuoteOfTheDayApp());
}

class QuoteOfTheDayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote of the Day',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuoteOfTheDayScreen(),
    );
  }
}

class QuoteOfTheDayScreen extends StatefulWidget {
  @override
  _QuoteOfTheDayScreenState createState() => _QuoteOfTheDayScreenState();
}

class _QuoteOfTheDayScreenState extends State<QuoteOfTheDayScreen> {
  final List<String> _quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
    // Add more quotes here
  ];

  String _currentQuote = '';

  @override
  void initState() {
    super.initState();
    _currentQuote = _getRandomQuote();
  }

  String _getRandomQuote() {
    final randomIndex = DateTime.now().day % _quotes.length;
    return _quotes[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quote of the Day')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_currentQuote,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentQuote = _getRandomQuote();
                  });
                },
                child: Text('Next Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
