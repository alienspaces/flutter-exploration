import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/flutter/borders_source.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class BordersScreen extends StatelessWidget {
  static String name = \'Borders\';
  static String description = \'Various Border implementations\';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(BordersScreen.name),
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
          child: BordersWidget(),
        ),
      ),
    );
  }
}

class ContainingWidget extends StatelessWidget {
  final Widget containerWidget;
  final String containerDescription;

  ContainingWidget({this.containerWidget, this.containerDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.only(top: 20, bottom: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minWidth: 100,
              minHeight: 140,
            ),
            color: Theme.of(context).colorScheme.surface,
            child: containerWidget,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(containerDescription, overflow: TextOverflow.fade),
          ),
        ],
      ),
    );
  }
}

class BordersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: <Widget>[
        // Uniform Border
        ContainingWidget(
          containerWidget: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondaryVariant,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          containerDescription: \'Uniform border all sides\',
        ),
        // Mismatched border widths
        ContainingWidget(
          containerWidget: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                top: BorderSide(
                  width: 2,
                ),
                right: BorderSide(
                  width: 4,
                ),
                bottom: BorderSide(
                  width: 8,
                ),
              ),
            ),
          ),
          containerDescription:
              \'Mismatched border widths. Cannot implement border radius with mismatched border widths.\',
        ),
        // Mismatched border colors
        ContainingWidget(
          containerWidget: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.blue[400],
                  width: 3,
                  style: BorderStyle.solid,
                ),
                top: BorderSide(
                  color: Colors.green[400],
                  width: 3,
                ),
                right: BorderSide(
                  color: Colors.yellow[400],
                  width: 3,
                ),
                bottom: BorderSide(
                  color: Colors.red[400],
                  width: 3,
                ),
              ),
            ),
          ),
          containerDescription:
              \'Mismatched border colours. Cannot implement border radius with mismatched border colours.\',
        ),
        // Top left and top right rounded borders only
        ContainingWidget(
          containerWidget: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          containerDescription: \'Top left and top right rounded borders only.\',
        ),
        // Bottom left and bottom right rounded borders only
        ContainingWidget(
          containerWidget: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryVariant,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          containerDescription: \'Bottom left and bottom right rounded borders only.\',
        ),
        // Top right and bottom right rounded borders only
        ContainingWidget(
          containerWidget: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          containerDescription: \'Top right and bottom right rounded borders only.\',
        ),
      ],
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
