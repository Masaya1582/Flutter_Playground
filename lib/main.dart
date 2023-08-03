import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(CollectionViewApp());
}

class CollectionViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CollectionView App',
      home: CollectionViewScreen(),
    );
  }
}

class CollectionViewScreen extends StatelessWidget {
  final List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection View App'),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 3, // Number of columns
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(items[index]),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
