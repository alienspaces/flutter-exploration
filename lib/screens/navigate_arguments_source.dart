import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class NavigateArgumentsScreen extends StatelessWidget {
  static String name = \'Navigate Arguments\';
  static String description = \'Pass arguments when routing\';

  static const routeName = \'/navigate-arguments\';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args != null ? args.title : \'No args title\'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            heightFactor: 10.0,
            child: Text(args != null ? args.message : \'No args message\'),
          ),
          Center(
            child: ElevatedButton(
              child: Text(\'Navigate to myself and extract arguments\'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NavigateArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    \'Boo!!\',
                    \'Hahahaha :D\',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
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
