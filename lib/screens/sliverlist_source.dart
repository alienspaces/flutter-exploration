import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class SliverListScreen extends StatelessWidget {
  static String name = \'Sliver List\';
  static String description = \'A simple SliverList with SliverChildBuilderDelegate\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Custom scroll view\'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(\'Floating app bar\'),
            floating: true,
            flexibleSpace: Container(
              alignment: Alignment.bottomCenter,
              child: Text(\'Flexible space\', style: Theme.of(context).textTheme.headline3),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text(\'Item #\$index\')),
              childCount: 1000,
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
