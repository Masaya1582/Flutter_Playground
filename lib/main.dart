import 'package:flutter/material.dart';

void main() {
  runApp(SimpleMemoApp());
}

class SimpleMemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Memo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MemoListScreen(),
    );
  }
}

class MemoListScreen extends StatefulWidget {
  @override
  _MemoListScreenState createState() => _MemoListScreenState();
}

class _MemoListScreenState extends State<MemoListScreen> {
  List<String> _memos = [];

  void _addMemo(String memo) {
    setState(() {
      _memos.add(memo);
    });
  }

  void _deleteMemo(int index) {
    setState(() {
      _memos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo List'),
      ),
      body: ListView.builder(
        itemCount: _memos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_memos[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteMemo(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final memo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMemoScreen()),
          );
          if (memo != null) {
            _addMemo(memo);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddMemoScreen extends StatelessWidget {
  final TextEditingController _memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Memo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _memoController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your memo',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _memoController.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
