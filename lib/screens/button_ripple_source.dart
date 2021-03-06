import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class ButtonRippleScreen extends StatelessWidget {
  static String name = \'Button Ripple\';
  static String description = \'Utilise an InkWell for ripple effects\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Button Ripple\'),
      ),
      body: Container(
        child: RippleButton(),
      ),
    );
  }
}

class RippleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(\'Tapper tapper\'),
            duration: Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: 400,
        height: 400,
        child: Text(\'Flat Button\', textAlign: TextAlign.center),
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
