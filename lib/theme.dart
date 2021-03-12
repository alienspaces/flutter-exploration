import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Returns the application theme data
ThemeData getTheme(BuildContext context) {
  return ThemeData(
    // Default font family.
    fontFamily: 'Lato',

    // NOTE: Setting the primaryColor provides some consistency
    // across screen colours as not all Flutter components correctly
    // use the defined colorTheme data provided further below.
    primaryColor: Color(0xFF9fa8da),

    // Default text theme.
    textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,
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
      background: Color(0xFFF8F8F8),
      onBackground: Colors.black,
      surface: Color(0xFFd1d9ff),
      onSurface: Colors.black,
    ),
  );
}
