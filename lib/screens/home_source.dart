import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/router.dart\';

/// This is the default home screen route which renders
/// all route categories and their configured routes

class HomeScreen extends StatelessWidget {
  static String name = \'Home Screen\';
  static String description = \'Lists all other screens that contain examples\';

  @override
  Widget build(BuildContext context) {
    // Build list of links to screens
    List<Widget> buildScreenList() {
      List<Widget> routeList = [];

      routeCategories.forEach((routeCategory) {
        // Add route category
        routeList.add(
          Container(
            margin: EdgeInsets.fromLTRB(18, 2, 18, 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryVariant,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 70,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 3, 0, 1),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      \'\${routeCategory.name}\',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 1, 0, 3),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      \'\${routeCategory.description ?? ""}\',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Add route category routes
        routeCategory.routes.forEach((route) {
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
                  Navigator.of(context).pushNamed(toSnakeCase(route.name)),
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
                          \'\${route.name}\',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 0, 3),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          \'\${route.description ?? ""}\',
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
      });

      return routeList;
    }

    // Content margin
    EdgeInsetsGeometry margin;
    if (MediaQuery.of(context).size.width > 800) {
      double marginLeftRight = (MediaQuery.of(context).size.width - 800) / 2;
      margin = EdgeInsets.fromLTRB(marginLeftRight, 0, marginLeftRight, 0);
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
              child: Text(\'Flutter Exploration\', style: Theme.of(context).textTheme.headline5),
            ),
            Expanded(
              child: Container(
                margin: margin,
                child: ListView(
                  children: buildScreenList(),
                ),
              ),
            ),
            Container(
              color: Color(0xFFF5F5F6),
              height: 50,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  \'A set of screens exploring the Flutter library.\',
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
