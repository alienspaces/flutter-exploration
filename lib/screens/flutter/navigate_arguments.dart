import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flutter/navigate_arguments_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class NavigateArgumentsScreen extends StatelessWidget {
  static String name = 'Navigate Arguments';
  static String description = 'Pass arguments when routing';
  static bool hide = false;

  static const routeName = '/navigate-arguments';

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
      // Common screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Common source code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Common screen body containing example
      body: ScreenBodyWidget(
        child: Column(
          children: <Widget>[
            Center(
              heightFactor: 10.0,
              child: Text(args != null ? args.message : 'No args message'),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Navigate to myself and extract arguments'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    NavigateArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'Boo!!',
                      'Hahahaha :D',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
