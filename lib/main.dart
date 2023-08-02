import 'package:flutter/material.dart';

void main() {
  runApp(SimpleChatApp());
}

class SimpleChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat App',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // Show the latest message at the bottom
                itemCount:
                    10, // Replace this with your actual message list length
                itemBuilder: (context, index) {
                  return _buildMessageItem(index);
                },
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(int index) {
    // Replace this with your actual message item widget
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment:
            index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.blue : Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Message $index', // Replace this with your actual message text
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: 'Type a message...'),
              textInputAction: TextInputAction.send,
              onSubmitted: (message) {
                // Handle sending the message here
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle sending the message here
            },
          ),
        ],
      ),
    );
  }
}
