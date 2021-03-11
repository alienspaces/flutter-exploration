import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/tabs_source.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class TabsScreen extends StatelessWidget {
  static String name = \'Tabs\';
  static String description = \'A simple TabBar with Tabs\';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        // Common application bar
        appBar: AppBar(
          title: Text(TabsScreen.name),
          actions: <Widget>[
            // Open source code
            OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bus)),
            ],
          ),
        ),
        // Screen list drawer
        drawer: ScreenListDrawerWidget(),
        // Source Code drawer
        endDrawer: SourceDrawerWidget(
          scaffoldKey: _scaffoldKey,
          sourceWidget: SourceWidget(),
        ),
        // Example
        body: TabBarView(
          children: [
            Text(\'Car\'),
            Text(\'Bicycle\'),
            Text(\'Bus\'),
          ],
        ),
      ),
    );
  }
}

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
