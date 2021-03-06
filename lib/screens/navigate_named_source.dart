import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class NavigateNamedScreen extends StatelessWidget {
  static String name = \'Naviagate Named\';
  static String description = \'Navigate to a named route\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Page 1\'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(\'Launch Screen\'),
          onPressed: () {
            Navigator.pushNamed(context, \'/navigate-named-second\');
          },
        ),
      ),
    );
  }
}

class NavigateNamedSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Page 2\'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(\'Go Back!\'),
          onPressed: () {
            Navigator.pop(context);
          },
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
