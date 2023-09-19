import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS-style Form"),
      ),
      child: SafeArea(
        child: CupertinoFormSection(
          header: Text("Personal Information"),
          children: [
            CupertinoFormRow(
              prefix: Text("First Name"),
              child: CupertinoTextFormFieldRow(
                placeholder: "Enter your first name",
              ),
            ),
            CupertinoFormRow(
              prefix: Text("Last Name"),
              child: CupertinoTextFormFieldRow(
                placeholder: "Enter your last name",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
