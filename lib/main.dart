import 'package:flutter/material.dart';

void main() {
  runApp(FoldTextApp());
}

class FoldTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fold Text Example'),
        ),
        body: Center(
          child: FoldedText(
            text:
                'For too long, a small group in our nation’s capital has reaped the rewards of government, while the people have borne the cost. Washington flourished, but the people did not share in its wealth. Politicians prospered, but the jobs left and the factories closed. The establishment protected itself, but not the citizens of our country. Their victories have not been your victories. Their triumphs have not been your triumphs, and while they celebrated in our nation’s capital, there was little to celebrate for struggling families all across our land. That all changes, starting right here and right now, because this moment is your moment --- it belongs to you. It belongs to everyone gathered here today, and everyone watching, all across America. This is your day. This is your celebration, and this, the United States of America, is your country.',
            maxLength: 50,
          ),
        ),
      ),
    );
  }
}

class FoldedText extends StatefulWidget {
  final String text;
  final int maxLength;

  FoldedText({required this.text, required this.maxLength});

  @override
  _FoldedTextState createState() => _FoldedTextState();
}

class _FoldedTextState extends State<FoldedText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded
                  ? widget.text
                  : (widget.text.length > widget.maxLength
                      ? '${widget.text.substring(0, widget.maxLength)}...'
                      : widget.text),
            ),
          ),
          if (widget.text.length > widget.maxLength)
            TextButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Show Less' : 'Show More',
                style: TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
