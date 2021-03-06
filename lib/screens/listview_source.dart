import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class ListViewScreen extends StatelessWidget {
  static String name = \'ListView\';
  static String description = \'A very simple ListView with static items\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'ListView Example\'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 640.0,
            height: 320.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text(\'Map\'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text(\'Album\'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(\'Phone\'),
                ),
              ],
            ),
          ),
          Container(
            width: 640.0,
            height: 320.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160.0,
                  color: Colors.orange,
                ),
                Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                Container(
                  width: 160.0,
                  color: Colors.pink,
                ),
                Container(
                  width: 160.0,
                  color: Colors.indigo,
                ),
              ],
            ),
          ),
        ],
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
