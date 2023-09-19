import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String numberString = "";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decimal Number -> Binary Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Result: $result", style: TextStyle(fontSize: 20)),
            TextField(
              decoration: InputDecoration(labelText: "Input Number"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  numberString = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double number = double.tryParse(numberString) ?? 0.0;
                setState(() {
                  result = convert(number);
                });
              },
              child: Text("Convert", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(primary: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  String convert(double number) {
    int integer = number.toInt();
    double fraction = number - integer;
    return '${intToBinaryNumberString(integer)}.${doubleToBinaryNumberString(fraction)}';
  }

  String intToBinaryNumberString(int number) {
    List<int> binaryDigits = [];
    while (number > 0) {
      binaryDigits.add(number % 2);
      number ~/= 2;
    }
    return binaryDigits.reversed.join();
  }

  String doubleToBinaryNumberString(double number) {
    String result = "";
    for (int i = 0; i < 6; i++) {
      number *= 2;
      result += number.toInt().toString();
      number -= number.toInt();
      if (number == 0) {
        return result;
      }
    }
    return result + "...";
  }
}
