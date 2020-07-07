import 'package:flutter/material.dart';

final Expanded leftColumn = Expanded(
  child: Container(
    color: Colors.black38,
    child: Column(
      children: [
        Text(
          'Column 1a',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
        Text(
          'Column 1b',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  ),
);

final rightColumn = Expanded(
  child: Container(
    color: Colors.blueAccent,
    child: Column(
      children: [
        Icon(Icons.timer, color: Colors.brown),
        Text(
          'Column 2a',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
        Text(
          'Column 2b',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  ),
);

class LayoutTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Container(
          color: Colors.black26,
          alignment: Alignment(0.0, 0.0),
          margin: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftColumn,
              rightColumn,
            ],
          ),
        ),
      ),
    );
  }
}
