import 'package:flutter/material.dart';

void main() {
  runApp(ContextMenuApp());
}

class ContextMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Menu Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContextMenuScreen(),
    );
  }
}

class ContextMenuScreen extends StatelessWidget {
  final List<String> itemList = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Context Menu Example')),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
            onLongPress: () {
              _showContextMenu(context, itemList[index]);
            },
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, String item) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    final relativePosition = RelativeRect.fromRect(
      Rect.fromPoints(
        overlay.localToGlobal(Offset.zero, ancestor: overlay),
        overlay.localToGlobal(overlay.semanticBounds.bottomRight,
            ancestor: overlay),
      ),
      Offset.zero & overlay.semanticBounds.size,
    );

    showMenu(
      context: context,
      position: relativePosition,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: Text('Edit $item'),
          onTap: () {
            Navigator.pop(context);
            // Perform edit action
          },
        ),
        PopupMenuItem(
          child: Text('Delete $item'),
          onTap: () {
            Navigator.pop(context);
            // Perform delete action
          },
        ),
      ],
    );
  }
}
