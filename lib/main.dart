import 'package:flutter/material.dart';

// import 'example_counter.dart';
// import 'example_layout.dart';
// import 'example_shopping_list.dart';
// import 'cookbook_animated_route.dart';
// import 'cookbook_draggable_card.dart';
// import 'cookbook_animated_container.dart';
// import 'cookbook_widget_fade.dart';
// import 'cookbook_drawer.dart';
// import 'cookbook_snackbar.dart';
// import 'cookbook_orientation.dart';
// import 'cookbook_tabs.dart';
// import 'cookbook_form_validation.dart';
// import 'cookbook_button_ripple.dart';
// import 'cookbook_dismissible.dart';
// import 'cookbook_fade_image.dart';
// import 'cookbook_listview.dart';
// import 'cookbook_gridview.dart';
import 'cookbook_differing_list.dart';

// NOTE: All examples have a HomeWidget class
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // Brightness and colours.
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],

      // Default font family.
      fontFamily: 'Open Sans',

      // Default text theme.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 15.0, fontFamily: 'Open Sans'),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Open Sans'),
      ),
    ),
    home: HomeWidget(),
  ));
}
