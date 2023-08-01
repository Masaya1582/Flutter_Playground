import 'package:flutter/material.dart';

void main() => runApp(SimpleQuizApp());

class SimpleQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question(
      questionText: 'What is the capital of France?',
      options: ['London', 'Berlin', 'Paris', 'Madrid'],
      correctOption: 'Paris',
    ),
    Question(
      questionText: 'What is 2 + 2?',
      options: ['1', '3', '4', '5'],
      correctOption: '4',
    ),
    Question(
      questionText: 'What is the largest planet in our solar system?',
      options: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      correctOption: 'Jupiter',
    ),
    Question(
      questionText: 'Who painted the Mona Lisa?',
      options: [
        'Leonardo da Vinci',
        'Vincent van Gogh',
        'Pablo Picasso',
        'Claude Monet'
      ],
      correctOption: 'Leonardo da Vinci',
    ),
    Question(
      questionText: 'What is the chemical symbol for water?',
      options: ['W', 'HO', 'H2O', 'O2'],
      correctOption: 'H2O',
    ),
    // Add more questions here...
  ];

  void _checkAnswer(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex].correctOption) {
      setState(() {
        _score++;
      });
    }
    _goToNextQuestion();
  }

  void _goToNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Show a dialog with the final score and reset the quiz
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Quiz Completed!'),
              content: Text('Your score: $_score/${_questions.length}'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentQuestionIndex = 0;
                      _score = 0;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Restart'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Quiz App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(height: 16.0),
            ..._questions[_currentQuestionIndex].options.map((option) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _checkAnswer(option),
                    child: Text(
                      option,
                      style: TextStyle(
                          fontSize: 24.0), // Set the desired font size here
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 80.0),
                    ),
                  ),
                  SizedBox(
                      height: 8.0), // Add the desired spacing between buttons
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctOption;

  Question(
      {required this.questionText,
      required this.options,
      required this.correctOption});
}
