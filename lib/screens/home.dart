import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/router.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'Home Screen';
  static String description = 'Lists all other screens that contain examples';

  @override
  Widget build(BuildContext context) {
    // Build list of links to screens
    List<Widget> buildScreenList() {
      List<Widget> routeList = [];
      routes.forEach((route) {
        // Skip home screen route
        if (route.name == HomeScreen.name) {
          return;
        }
        routeList.add(
          Container(
            margin: EdgeInsets.fromLTRB(18, 2, 18, 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary,
                ),
                shadowColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondaryVariant,
                ),
              ),
              onPressed: () => {
                Navigator.of(context).pushNamed(RouteConfig.toSnakeCase(route.name)),
              },
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).colorScheme.primaryVariant,
              height: 30,
            ),
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: 50,
              alignment: Alignment.center,
              child: Text('Flutter Exploration', style: Theme.of(context).textTheme.headline5),
            ),
            Expanded(
              child: ListView(
                children: buildScreenList(),
              ),
            ),
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
