import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Step Progress Indicator App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StepProgressIndicator(
                totalSteps: 5,
                currentStep: 3,
                selectedColor: Colors.blue,
                unselectedColor: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                'Step 3 of 5',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
