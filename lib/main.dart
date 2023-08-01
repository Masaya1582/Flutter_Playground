import 'package:flutter/material.dart';

void main() {
  runApp(HorizontalListApp());
}

class HorizontalListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal List App',
      home: HorizontalListScreen(),
    );
  }
}

class HorizontalListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      'title': 'Swift',
      'image':
          'https://masasophi.com/wp-content/uploads/2023/05/normal_swift.001.png',
    },
    {
      'title': 'SwiftUI',
      'image':
          'https://masasophi.com/wp-content/uploads/2023/05/swiftui_image.001.png',
    },
    {
      'title': 'Swift_Error',
      'image':
          'https://masasophi.com/wp-content/uploads/2023/05/swift_error.png',
    },
    {
      'title': 'Swift_Error',
      'image':
          'https://masasophi.com/wp-content/uploads/2023/05/swift_error.png',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal List'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return HorizontalListItem(
            title: dataList[index]['title'],
            imageUrl: dataList[index]['image'],
          );
        },
      ),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  HorizontalListItem({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
