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
    primaryColor: Color(0xFF383f51),

    // Default text theme.
    textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF383f51),
      primaryVariant: Color(0xFF1c2029),
      onPrimary: Color(0xFFEFEFEF),
      secondary: Color(0xFF3c4f76),
      secondaryVariant: Color(0xFF253149),
      onSecondary: Color(0xFFcac3c2),
      error: Colors.orange[100],
      onError: Colors.black,
      background: Color(0xFFF8F8F8),
      onBackground: Colors.black,
      surface: Color(0xFFededed),
      onSurface: Colors.black,
    ),
  );
}
