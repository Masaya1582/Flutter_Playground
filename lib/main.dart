import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expand Operator Demo',
      home: CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _categoriesStreamController = StreamController<List<String>>();

  @override
  void initState() {
    super.initState();

    final categories = [
      'Fruits',
      'Vegetables',
      'Snacks',
    ];

    _categoriesStreamController.sink.add(categories);
  }

  @override
  void dispose() {
    _categoriesStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: StreamBuilder<List<String>>(
        stream: _categoriesStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data!;
            final expandedItems = categories.expand((category) {
              return [
                ListTile(
                  title: Text(category,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Divider(),
                ListTile(
                  title: Text('Item 1'),
                ),
                ListTile(
                  title: Text('Item 2'),
                ),
              ];
            });

            return ListView(
              children: List<Widget>.from(expandedItems),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
