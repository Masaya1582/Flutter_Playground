import 'package:flutter/material.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double inputValue = 0.0;
  String selectedFromUnit = 'Meters';
  String selectedToUnit = 'Feet';
  double resultValue = 0.0;

  Map<String, double> unitConversionMap = {
    'Meters': 1,
    'Feet': 3.28084,
    'Yards': 1.09361,
  };

  void convertUnits() {
    double? fromUnitValue = unitConversionMap[selectedFromUnit];
    double? toUnitValue = unitConversionMap[selectedToUnit];
    if (fromUnitValue != null && toUnitValue != null) {
      resultValue = inputValue * (toUnitValue / fromUnitValue);
    } else {
      resultValue = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unit Converter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                  convertUnits();
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter value'),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedFromUnit,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedFromUnit = newValue;
                    convertUnits();
                  });
                }
              },
              items: unitConversionMap.keys.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 20),
            Text('to'),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedToUnit,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedToUnit = newValue;
                    convertUnits();
                  });
                }
              },
              items: unitConversionMap.keys.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 20),
            Text('Result: $resultValue'),
          ],
        ),
      ),
    );
  }
}
