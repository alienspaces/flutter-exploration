import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/navigate_named_source.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class NavigateNamedScreen extends StatelessWidget {
  static String name = 'Naviagate Named';
  static String description = 'Navigate to a named route';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(NavigateNamedScreen.name),
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
      body: Center(
        child: ElevatedButton(
          child: Text('Launch Screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/navigate-named-second');
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
        title: Text('Page 2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
