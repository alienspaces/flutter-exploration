import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/navigate_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class NavigateScreen extends StatelessWidget {
  static String name = 'Navigate';
  static String description = 'Simple navigation between screens';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(NavigateScreen.name),
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
      body: ScreenBodyWidget(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return NavigateSecondScreen();
            }));
          },
          child: Center(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/en/e/ed/G1-3_Against_the_Giants.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

class NavigateSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: ScreenBodyWidget(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/T1ModuleCover.jpg/200px-T1ModuleCover.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
