import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/widgets/screen_list_drawer.dart';

/// This is the default home screen route which renders
/// all route categories and their configured routes

class HomeScreen extends StatelessWidget {
  static String name = 'Home Screen';
  static String description = 'Lists all other screens that contain examples';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(name, style: Theme.of(context).textTheme.headline5),
      ),
      drawer: ScreenListDrawerWidget(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xFFF5F5F6),
              height: 50,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'A set of screens exploring the Flutter library.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
