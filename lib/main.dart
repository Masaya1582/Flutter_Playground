import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ReminderApp());
}

class ReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      home: ReminderListScreen(),
    );
  }
}

class Reminder {
  String title;
  DateTime dateTime;

  Reminder({required this.title, required this.dateTime});
}

class ReminderListScreen extends StatefulWidget {
  @override
  _ReminderListScreenState createState() => _ReminderListScreenState();
}

class _ReminderListScreenState extends State<ReminderListScreen> {
  List<Reminder> reminders = [];

  void _addReminder(Reminder reminder) {
    setState(() {
      reminders.add(reminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reminders[index].title),
            subtitle: Text(DateFormat('yyyy-MM-dd HH:mm')
                .format(reminders[index].dateTime)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddReminderDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddReminderDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 16),
              DateTimeField(
                format: DateFormat("yyyy-MM-dd HH:mm"),
                onShowPicker: (context, currentValue) async {
                  DateTime? selectedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );

                  if (selectedDateTime != null) {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );

                    if (selectedTime != null) {
                      selectedDateTime = DateTime(
                        selectedDateTime.year,
                        selectedDateTime.month,
                        selectedDateTime.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );

                      // Update the selectedDate variable with the selectedDateTime
                      selectedDate = selectedDateTime;
                    }
                  }

                  return selectedDateTime;
                },
              ),
            ],
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
                if (titleController.text.isNotEmpty && selectedDate != null) {
                  _addReminder(Reminder(
                      title: titleController.text, dateTime: selectedDate!));
                  Navigator.of(context).pop();
                } else {
                  // Show an error message if the title or date is not selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Please enter a title and select a date.')),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
