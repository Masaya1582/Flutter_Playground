import 'dart:async';

import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;

  User(this.id, this.name);
}

Future<User> fetchUserDataFromSourceA() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate fetching data
  return User('123', 'Alice');
}

Future<User> fetchUserDataFromSourceB() async {
  await Future.delayed(Duration(seconds: 3)); // Simulate fetching data
  return User('456', 'Bob');
}

Stream<User> combineFuturesToStream(
    Future<User> futureA, Future<User> futureB) async* {
  final userA = await futureA;
  yield userA;

  final userB = await futureB;
  yield userB;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combine Futures and Streams Demo',
      home: UserDisplayPage(),
    );
  }
}

class UserDisplayPage extends StatefulWidget {
  @override
  _UserDisplayPageState createState() => _UserDisplayPageState();
}

class _UserDisplayPageState extends State<UserDisplayPage> {
  final Stream<User> _combinedStream = combineFuturesToStream(
    fetchUserDataFromSourceA(),
    fetchUserDataFromSourceB(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Display'),
      ),
      body: Center(
        child: StreamBuilder<User>(
          stream: _combinedStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User ID: ${user.id}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('User Name: ${user.name}',
                      style: TextStyle(fontSize: 18)),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error fetching user data');
            } else {
              return Text('No user data available');
            }
          },
        ),
      ),
    );
  }
}
