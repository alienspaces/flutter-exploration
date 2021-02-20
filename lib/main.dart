import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/theme.dart';
import 'package:flutterexploration/router.dart';

void main() {
  runApp(
    MaterialApp(
      theme: getTheme(),
      initialRoute: '/',
      routes: getRoutes(),
    ),
  );
}
