import 'package:flutter/material.dart';

void main() => runApp(TipCalculatorApp());

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TipCalculatorScreen(),
    );
  }
}

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  double billAmount = 0.0;
  double tipPercentage = 15.0;

  void _calculateTip() {
    setState(() {
      // Calculate the tip amount
      double tipAmount = billAmount * tipPercentage / 100;
      // Round the tip amount to 2 decimal places
      tipAmount = double.parse(tipAmount.toStringAsFixed(2));
      // Show the tip amount in a dialog
      _showTipDialog(tipAmount);
    });
  }

  void _showTipDialog(double tipAmount) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tip Amount'),
          content: Text('Tip: \$$tipAmount'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Bill Amount (\$)'),
              onChanged: (value) {
                setState(() {
                  billAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Slider(
              value: tipPercentage,
              min: 0,
              max: 30,
              divisions: 6,
              label: '${tipPercentage.toStringAsFixed(1)}%',
              onChanged: (value) {
                setState(() {
                  tipPercentage = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateTip,
              child: Text('Calculate Tip'),
            ),
          ],
        ),
      ),
    );
  }
}
