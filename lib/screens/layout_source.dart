import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {
  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/layout_source.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

final Expanded leftColumn = Expanded(
  child: Container(
    color: Colors.black38,
    child: Column(
      children: [
        Text(
          \'Column 1a\',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
        Text(
          \'Column 1b\',
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
          \'Column 2a\',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
        Text(
          \'Column 2b\',
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
  static String name = \'Layout\';
  static String description = \'Very basic layout Row\';
  static bool hide = false;

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
      // Common screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Common source code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Common screen body containing example
      body: ScreenBodyWidget(
        child: Container(
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

  ''';

  @override
  Widget build(BuildContext context) {
    // Adjust font size based on screen width
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontSize = 20;
    if (width < 1024) {
      fontSize = 14;
    } else if (width < 2048) {
      fontSize = 18;
    }

    return Container(
      alignment: Alignment.topLeft,
      color: Theme.of(context).colorScheme.background,
      child: Container(
        // Setting minimum height allows scrolling when
        // content height is greater than the screen height
        constraints: BoxConstraints(
          minHeight: height,
        ),
        color: Theme.of(context).colorScheme.secondary,
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: HighlightView(
          "$textContent",
          language: 'dart',
          theme: githubTheme,
          padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
