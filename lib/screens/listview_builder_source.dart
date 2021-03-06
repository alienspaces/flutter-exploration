import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class ListViewBuilderScreen extends StatelessWidget {
  static String name = \'ListView Builder\';
  static String description = \'A simple list using ListView builder\';

  final List<String> items = List<String>.generate(10000, (i) => "Item \$i");
  ListViewBuilderScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = \'Long List\';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(\'\${items[index]}\'),
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
