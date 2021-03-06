import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class GridviewScreen extends StatelessWidget {
  static String name = \'GridView\';
  static String description = \'A simple GridView\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'GridView Example\'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                  color: Colors.yellow,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                \'Item \$index\',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          );
        }),
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
