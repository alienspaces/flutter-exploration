import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class TabsScreen extends StatelessWidget {
  static String name = \'Tabs\';
  static String description = \'A simple TabBar with Tabs\';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bus)),
            ],
          ),
          title: Text(\'TABS Example\'),
        ),
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
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        padding: EdgeInsets.all(12),
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
