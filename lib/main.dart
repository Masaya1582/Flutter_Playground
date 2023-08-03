import 'package:flutter/material.dart';

void main() => runApp(TableViewApp());

class TableViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TableViewScreen(),
    );
  }
}

class TableViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableView App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Age')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('John')),
                  DataCell(Text('28')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Alice')),
                  DataCell(Text('25')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Bob')),
                  DataCell(Text('32')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('Kate')),
                  DataCell(Text('23')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('Michael')),
                  DataCell(Text('35')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6')),
                  DataCell(Text('Emily')),
                  DataCell(Text('29')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7')),
                  DataCell(Text('Daniel')),
                  DataCell(Text('31')),
                ]),
                DataRow(cells: [
                  DataCell(Text('8')),
                  DataCell(Text('Sophia')),
                  DataCell(Text('27')),
                ]),
                DataRow(cells: [
                  DataCell(Text('9')),
                  DataCell(Text('Henry')),
                  DataCell(Text('24')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Olivia')),
                  DataCell(Text('26')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
