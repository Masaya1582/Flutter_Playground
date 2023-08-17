import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'combineLatest Operator Demo',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _counterAController = BehaviorSubject<int>.seeded(0);
  final _counterBController = BehaviorSubject<int>.seeded(0);

  @override
  void dispose() {
    _counterAController.close();
    _counterBController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Combine'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: Rx.combineLatest2(
            _counterAController.stream,
            _counterBController.stream,
            (a, b) => a + b,
          ),
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final sum = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter A: ${_counterAController.value}'),
                  Text('Counter B: ${_counterBController.value}'),
                  SizedBox(height: 20),
                  Text('Sum of Counters: $sum',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                _counterAController.add(_counterAController.value + 1),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                _counterBController.add(_counterBController.value + 1),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
