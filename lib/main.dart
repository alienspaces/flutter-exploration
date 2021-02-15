import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/animated_container.dart';
import 'package:flutterexploration/screens/animated_route.dart';
import 'package:flutterexploration/screens/button_ripple.dart';
import 'package:flutterexploration/screens/counter.dart';
import 'package:flutterexploration/screens/differing_list.dart';
import 'package:flutterexploration/screens/dismissable.dart';
import 'package:flutterexploration/screens/draggable_card.dart';
import 'package:flutterexploration/screens/drawer.dart';
import 'package:flutterexploration/screens/fade_image.dart';
import 'package:flutterexploration/screens/file_io.dart';
import 'package:flutterexploration/screens/form_validation.dart';
import 'package:flutterexploration/screens/gridview.dart';
import 'package:flutterexploration/screens/keyvalue_store.dart';
import 'package:flutterexploration/screens/layout.dart';
import 'package:flutterexploration/screens/listview.dart';
import 'package:flutterexploration/screens/listview_builder.dart';
import 'package:flutterexploration/screens/navigate.dart';
import 'package:flutterexploration/screens/navigate_arguments.dart';
import 'package:flutterexploration/screens/navigate_named.dart';
import 'package:flutterexploration/screens/navigate_return_data.dart';
import 'package:flutterexploration/screens/navigate_send_data.dart';
import 'package:flutterexploration/screens/network_get_data.dart';
import 'package:flutterexploration/screens/network_get_large_data.dart';
import 'package:flutterexploration/screens/network_send_data.dart';
import 'package:flutterexploration/screens/orientation_change.dart';
import 'package:flutterexploration/screens/shopping_list.dart';
import 'package:flutterexploration/screens/sliverlist.dart';
import 'package:flutterexploration/screens/snackbar.dart';
import 'package:flutterexploration/screens/tabs.dart';
import 'package:flutterexploration/screens/widget_fade.dart';

// Routes - Add routes to new screens here
var routes = <String, dynamic>{
  '/': OrientationScreen(),
  '/animated-container': AnimatedContainerScreen(),
  '/animated-route': AnimatedRouteScreen(),
  '/button-ripple': ButtonRippleScreen(),
  '/counter': CounterScreen(),
  '/differing-list': DifferingListScreen(),
  '/dismissable': DismissableScreen(),
  '/draggable-card': DraggableCardScreen(),
  '/drawer': DrawerScreen(),
  '/fade-image': FadeImageScreen(),
  '/fade-io': FileIOScreen(),
  '/form-validation': FormValidationScreen(),
  '/gridview': GridviewScreen(),
  '/keyvalue-store': KeyValueStoreScreen(),
  '/layout': LayoutScreen(),
  '/listview': ListViewScreen(),
  '/listview-builder': ListViewBuilderScreen(),
  '/navigate': NavigateScreen(),
  '/navigate-arguments': NavigateArgumentsScreen(),
  '/navigate-named': NavigateNamedScreen(),
  '/navigate-named-second': NavigateNamedSecondScreen(),
  '/navigate-return-data': NavigateReturnDataScreen(),
  '/navigate-send-data': NavigateSendDataScreen(),
  '/network-get-data': NetworkGetDataScreen(),
  '/network-get-large-data': NetworkGetLargeDataScreen(),
  '/network-send-data': NetworkSendDataScreen(),
  '/orientation': OrientationChangeScreen(),
  '/shopping-list': ShoppingListScreen(),
  '/sliverlist': SliverListScreen(),
  '/snackbar': SnackBarScreen(),
  '/tabs': TabsScreen(),
  '/widget-fade': WidgetFadeScreen(),
};

// Generate application reoutes
Map<String, Widget Function(BuildContext)> generateApplicationRoutes() {
  Map<String, Widget Function(BuildContext)> applicationRoutes = {};

  routes.keys.forEach((keyName) {
    applicationRoutes[keyName] = (context) => routes[keyName];
  });

  return applicationRoutes;
}

// NOTE: All examples have a OrientationScreen class
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
      routes: generateApplicationRoutes(),
    ),
  );
}

class OrientationScreen extends StatelessWidget {
  // Build list of links to screens
  List<Widget> buildScreenList(BuildContext context) {
    List<Widget> routeList = [];
    routes.keys.forEach((keyName) {
      // Skip '/' root route
      if (keyName == '/') {
        return;
      }
      routeList.add(
        Container(
          margin: EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: RaisedButton(
            onPressed: () => {Navigator.of(context).pushNamed(keyName)},
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('$keyName'),
            ),
          ),
        ),
      );
    });
    return routeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16, 60, 10, 20),
              child: Text('Exploration', style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child: ListView(
                children: buildScreenList(context),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 18, 10, 20),
              child: Text(
                'An ever growing list of screens demonstrating various Flutter features.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
