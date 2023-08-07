import 'package:flutter/material.dart';

void main() {
  runApp(MemeGeneratorApp());
}

class MemeGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MemeGeneratorScreen(),
    );
  }
}

class MemeGeneratorScreen extends StatefulWidget {
  @override
  _MemeGeneratorScreenState createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  TextEditingController _topTextController = TextEditingController();
  TextEditingController _bottomTextController = TextEditingController();
  String _imageUrl = 'https://via.placeholder.com/400'; // Default image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meme Generator')),
      body: Column(
        children: [
          SizedBox(height: 16),
          TextField(
            controller: _topTextController,
            decoration: InputDecoration(hintText: 'Top Text'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _bottomTextController,
            decoration: InputDecoration(hintText: 'Bottom Text'),
          ),
          SizedBox(height: 16),
          Image.network(_imageUrl, height: 200),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _imageUrl =
                    'https://api.memegen.link/images/custom/${_topTextController.text}/${_bottomTextController.text}.png';
              });
            },
            child: Text('Generate Meme'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _topTextController.dispose();
    _bottomTextController.dispose();
    super.dispose();
  }
}
