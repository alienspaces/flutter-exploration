import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/theme.dart';
import 'package:flutterexploration/router.dart';

void main() {
  var defaultRoute = getDefaultRoute();
  if (defaultRoute == null) {
    throw 'Default route not configured, cannot continue';
  }

  runApp(
    MaterialApp(
      theme: getTheme(),
      initialRoute: RouteConfig.toSnakeCase(defaultRoute.name),
      routes: getRoutes(),
    ),
  );
}
