import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageFetcherApp(),
    );
  }
}

class ImageFetcherApp extends StatefulWidget {
  @override
  _ImageFetcherAppState createState() => _ImageFetcherAppState();
}

class _ImageFetcherAppState extends State<ImageFetcherApp> {
  String imageUrl = '';

  Future<void> fetchImage() async {
    final response = await http.get(Uri.parse(
        'https://masasophi.com/wp-content/uploads/2023/05/normal_swift.001.png'));
    if (response.statusCode == 200) {
      setState(() {
        imageUrl = response.headers['location'] ?? '';
      });
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Fetcher App'),
      ),
      body: Center(
        child: imageUrl.isEmpty
            ? CircularProgressIndicator()
            : Image.network(
                imageUrl,
                width: 300,
                height: 300,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        tooltip: 'Fetch Image',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
