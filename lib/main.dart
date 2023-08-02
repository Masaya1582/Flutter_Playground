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
            // Navigate to the second screen on button press
            Navigator.push(
              context,
              FadePageRoute(
                builder: (context) => SecondScreen(),
                settings: RouteSettings(name: 'SecondScreen'),
              ),
            );
          },
          child: Text('Go to Second Screen'),
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
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Go back to the home screen on button press
            Navigator.pop(context);
          },
          child: Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}

// Custom FadePageRoute for the transition animation
class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
