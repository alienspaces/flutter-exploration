import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/router.dart';

class ScreenListDrawerWidget extends StatelessWidget {
  @override
  build(BuildContext context) {
    // Route
    var route = ModalRoute.of(context);
    String currentRouteName = '';
    if (route != null) {
      currentRouteName = route.settings.name;
    }

    // Build list of links to screens
    List<Widget> buildScreenList() {
      List<Widget> routeList = [];

      routeCategories.forEach((routeCategory) {
        // Add route category
        routeList.add(
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            margin: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${routeCategory.name}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${routeCategory.description ?? ""}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Add route category routes
        routeCategory.routes.forEach((route) {
          String routeName = toSnakeCase(route.name);
          bool currentRoute = currentRouteName == routeName;

          if (route.hide == true) {
            return;
          }

          routeList.add(
            ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              onTap: () => {
                Navigator.of(context).pushReplacementNamed(routeName),
              },
              title: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${route.name}',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: currentRoute
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              subtitle: Container(
                margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${route.description ?? ""}',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: currentRoute
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              selected: currentRoute,
              selectedTileColor: Theme.of(context).colorScheme.secondary,
            ),
          );
          routeList.add(
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[400],
            ),
          );
        });
      });

      return routeList;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: buildScreenList(),
      ),
    );
  }
}
