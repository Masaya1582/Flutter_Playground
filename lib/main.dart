import 'package:flutter/material.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the second screen as a modal
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
                fullscreenDialog: true, // Set to true to show as a modal
              ),
            );
          },
          child: Text('Show Modal'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Close the modal when the button is pressed
            Navigator.pop(context);
          },
          child: Text('Close Modal'),
        ),
      ),
    );
  }
}
