import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    {'image': 'img_barack.jpeg', 'text': 'Obama'},
    // Add more items here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GridItem(
            image: items[index]['image']!,
            text: items[index]['text']!,
          );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String image;
  final String text;

  GridItem({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
                'assets/images/$image'), // Assuming images are in the 'assets' folder
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
