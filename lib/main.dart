import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(LanguageFlashcardsApp());

class LanguageFlashcardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Flashcards',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlashcardScreen(),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Map<String, String>> flashcards = [
    {'english': 'Apple', 'spanish': 'Manzana'},
    {'english': 'Car', 'spanish': 'Coche'},
    {'english': 'Sun', 'spanish': 'Sol'},
    // Add more flashcards here
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Language Flashcards')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: FlashcardSide(
                text: flashcards[currentIndex]['english']!,
                textColor: Colors.black,
              ),
              back: FlashcardSide(
                text: flashcards[currentIndex]['spanish']!,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = (currentIndex + 1) % flashcards.length;
                });
              },
              child: Text('Next Card'),
            ),
          ],
        ),
      ),
    );
  }
}

class FlashcardSide extends StatelessWidget {
  final String text;
  final Color textColor;

  FlashcardSide({required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
