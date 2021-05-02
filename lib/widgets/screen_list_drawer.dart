import 'package:logging/logging.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/router.dart';

class ScreenListDrawerWidget extends StatelessWidget {
  @override
  build(BuildContext context) {
    final log = Logger('ScreenListDrawerWidget - build');

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var categoryWidth = (width / routeCategories.length) - 30;
    if (categoryWidth > 300) {
      categoryWidth = 300;
    }
    double scale = 1;

    // Scale titles down based on width
    if (width < 500) {
      scale = 0.8;
    } else if (width < 800) {
      scale = 0.9;
    }

    log.info('Building width >$width< scale >$scale<');

    // Route
    var route = ModalRoute.of(context);
    String currentRouteName = '';
    if (route != null) {
      currentRouteName = route.settings.name;
    }

    // Build list of links to screens
    Widget buildScreenList() {
      List<Widget> categoryColumnList = [];

      routeCategories.forEach((routeCategory) {
        List<Widget> routeList = [];

        // Add route category
        routeList.add(
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.topLeft,
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Title
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      '${routeCategory.name}',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Theme.of(context).textTheme.headline5.fontSize * scale,
                          ),
                    ),
                  ),
                  // Description
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${routeCategory.description ?? ""}',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
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
                alignment: Alignment.topLeft,
                child: Text(
                  '${route.name}',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: currentRoute
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: Theme.of(context).textTheme.headline6.fontSize * scale,
                      ),
                ),
              ),
              subtitle: Container(
                margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                alignment: Alignment.topLeft,
                child: Text(
                  '${route.description ?? ""}',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: currentRoute
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: Theme.of(context).textTheme.bodyText2.fontSize * scale,
                      ),
                ),
              ),
              selected: currentRoute,
              selectedTileColor: Theme.of(context).colorScheme.secondaryVariant,
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

        // Add list of routes to category column list
        categoryColumnList.add(
          Container(
            width: categoryWidth,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: routeList,
            ),
          ),
        );
      });

      return Container(
        alignment: Alignment.topLeft,
        color: Theme.of(context).colorScheme.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: categoryColumnList,
        ),
      );
    }

    return Container(
      width: categoryWidth * routeCategories.length,
      child: Drawer(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: buildScreenList(),
          ),
        ),
      ),
    );
  }
}
