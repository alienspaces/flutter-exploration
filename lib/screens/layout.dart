import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/layout_source.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

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

class LayoutScreen extends StatelessWidget {
  static String name = 'Layout';
  static String description = 'Very basic layout Row';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(LayoutScreen.name),
        actions: <Widget>[
          // Open source code
          OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
        ],
      ),
      // Screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Source Code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Example
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
    );
  }
}
