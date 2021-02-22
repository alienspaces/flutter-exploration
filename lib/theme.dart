import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    // Default font family.
    fontFamily: 'Open Sans',

    // NOTE: Setting the primaryColor provides some consistency
    // across screen colours as not all Flutter components correctly
    // use the defined colorTheme data provided further below.
    primaryColor: Color(0xFF9fa8da),

    // Default text theme.
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 96.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
      overline: TextStyle(
        fontSize: 10.0,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
      caption: TextStyle(
        fontSize: 12.0,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF9fa8da),
      primaryVariant: Color(0xFF6f79a8),
      onPrimary: Colors.black,
      secondary: Color(0xFF90caf9),
      secondaryVariant: Color(0xFF5d99c6),
      onSecondary: Colors.black,
      error: Colors.orange[100],
      onError: Colors.black,
      background: Color(0xFFE1E2E1),
      onBackground: Colors.black,
      surface: Color(0xFFd1d9ff),
      onSurface: Colors.black,
    ),
  );
}
