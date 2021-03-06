import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class NavigateScreen extends StatelessWidget {
  static String name = \'Navigate\';
  static String description = \'Simple navigation between screens\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Page 1\'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SecondScreen();
          }));
        },
        child: Image.network(
          \'https://upload.wikimedia.org/wikipedia/en/e/ed/G1-3_Against_the_Giants.jpg\',
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Page 2\'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            \'https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/T1ModuleCover.jpg/200px-T1ModuleCover.jpg\',
          ),
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
