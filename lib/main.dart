import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Palette App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorPaletteScreen(),
    );
  }
}

class ColorPaletteScreen extends StatelessWidget {
  final List<Color> colorPalette = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.yellow,
    Colors.pink,
    Colors.indigo,
    Colors.lime,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Palette App'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: colorPalette.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showColorDialog(context, colorPalette[index]);
            },
            child: Container(
              color: colorPalette[index],
            ),
          );
        },
      ),
    );
  }

  void _showColorDialog(BuildContext context, Color selectedColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Color'),
          content: Container(
            height: 100,
            color: selectedColor,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
