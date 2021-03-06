import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class OrientationChangeScreen extends StatelessWidget {
  static String name = \'Orientation Change\';
  static String description = \'Adjust layout when device orientation changes\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Change items per row by adjusting orientation\'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  \'Thing \$index\',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }),
          );
        },
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
