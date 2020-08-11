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
// import 'cookbook_differing_list.dart';
// import 'cookbook_sliverlist.dart';
// import 'cookbook_listview_builder.dart';
// import 'cookbook_navigate_across_screens.dart';
// import 'cookbook_navigate_named_routes.dart';
// import 'cookbook_navigate_arguments.dart';
// import 'cookbook_navigate_return_data.dart';
// import 'cookbook_navigate_send_data.dart';
// import 'cookbook_network_get_data.dart';
// import 'cookbook_network_send_data.dart';
// import 'cookbook_network_get_large_data.dart';
// import 'cookbook_listview.dart';
// import 'cookbook_file_io.dart';
import 'cookbook_keyvalue_store.dart';

// NOTE: All examples have a HomeScreen class
void main() {
  runApp(
    MaterialApp(
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        // NOTE: The following route will not be valid for all examples so if
        // you get compile errors comment out the following line!
        // '/second': (context) => SecondScreen(),
      },
    ),
  );
}
