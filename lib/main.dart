import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FancyListView(),
    );
  }
}

class FancyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fancy ListView'),
      ),
      body: ListView.builder(
        itemCount: 20, // Change this to your desired number of items
        itemBuilder: (context, index) {
          return Card(
            elevation: 5, // Adds a shadow to the card
            margin: EdgeInsets.all(10), // Adds margin around each card
            child: ListTile(
              leading: CircleAvatar(
                // You can customize the avatar as needed
                backgroundColor: Colors.blue,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text('Item $index'),
              subtitle: Text('Subtitle for Item $index'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item click here
                print('Item $index clicked');
              },
            ),
          );
        },
      ),
    );
  }
}
