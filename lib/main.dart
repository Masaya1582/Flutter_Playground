import 'package:flutter/material.dart';

void main() {
  runApp(NoteTakingApp());
}

class NoteTakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<String> notes = [];

  void addNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController noteController = TextEditingController();
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            controller: noteController,
            decoration: InputDecoration(hintText: 'Enter your note'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  notes.add(noteController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void editNote(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController noteController =
            TextEditingController(text: notes[index]);
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            controller: noteController,
            decoration: InputDecoration(hintText: 'Enter your note'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  notes[index] = noteController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note-taking App'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Dismissible(
            key: Key(note),
            onDismissed: (direction) {
              deleteNote(index);
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
            ),
            child: ListTile(
              title: Text(note),
              onTap: () {
                editNote(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: Icon(Icons.add),
      ),
    );
  }
}
