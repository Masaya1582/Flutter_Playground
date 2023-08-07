import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> _board =
      List.generate(3, (_) => List.generate(3, (_) => ' '));
  String _currentPlayer = 'X';

  void _makeMove(int row, int col) {
    if (_board[row][col] == ' ') {
      setState(() {
        _board[row][col] = _currentPlayer;
        _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int row = 0; row < 3; row++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int col = 0; col < 3; col++)
                    GestureDetector(
                      onTap: () => _makeMove(row, col),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                            _board[row][col],
                            style: TextStyle(fontSize: 36),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
