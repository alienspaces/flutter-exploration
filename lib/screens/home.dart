import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/router.dart';

class HomeScreen extends StatelessWidget {
  static String description = 'Lists all other screens that contain examples';

  // Build list of links to screens
  List<Widget> buildScreenList(BuildContext context) {
    List<Widget> routeList = [];
    routes.forEach((route) {
      // Skip '/' root route
      if (route.name == '/') {
        return;
      }
      routeList.add(
        Container(
          margin: EdgeInsets.fromLTRB(18, 2, 18, 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          height: 50,
          child: ElevatedButton(
            onPressed: () => {Navigator.of(context).pushNamed(route.name)},
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 3, 0, 1),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${route.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 1, 0, 3),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${route.description ?? ""}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    return routeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16, 60, 10, 10),
              child: Text('Exploration', style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child: ListView(
                children: buildScreenList(context),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 18, 10, 20),
              child: Text(
                'An ever growing list of screens exploring the Flutter library.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
