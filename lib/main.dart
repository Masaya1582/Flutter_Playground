import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(HalfModalViewApp());
}

class HalfModalViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Half Modal View Example"),
        ),
        body: ContentView(),
      ),
    );
  }
}

class ContentView extends StatelessWidget {
  final PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      minHeight: 50, // Height of the collapsed panel
      maxHeight: 300, // Height of the expanded panel
      panel: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "This is the half modal view content.",
              style: TextStyle(fontSize: 20.0),
            ),
            // Add additional widgets for your half modal content
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (panelController.isPanelOpen) {
              panelController.close();
            } else {
              panelController.open();
            }
          },
          child: Text("Toggle Half Modal"),
        ),
      ),
    );
  }
}
