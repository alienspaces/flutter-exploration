import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/navigate_arguments_source.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class NavigateArgumentsScreen extends StatelessWidget {
  static String name = \'Navigate Arguments\';
  static String description = \'Pass arguments when routing\';

  static const routeName = \'/navigate-arguments\';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(NavigateArgumentsScreen.name),
        actions: <Widget>[
          // Open source code
          OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
        ],
      ),
      // Screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Source Code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Example
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
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
