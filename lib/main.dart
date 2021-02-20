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

class Route {
  String route;
  String description;
  Widget screen;

  Route({this.route, this.description, this.screen});
}

List<Route> myRoutes = [
  Route(
    route: '/',
    description: HomeScreen.description,
    screen: HomeScreen(),
  ),
  Route(
    route: '/animated-container',
    description: "Randomly adjust the properties of an AnimatedContainer",
    screen: AnimatedContainerScreen(),
  ),
  Route(
    route: '/animated-route',
    description: "Slide transition between two pages",
    screen: AnimatedRouteScreen(),
  ),
  Route(
    route: '/button-ripple',
    screen: ButtonRippleScreen(),
  ),
  Route(
    route: '/counter',
    screen: CounterScreen(),
  ),
  Route(
    route: '/differing-list',
    screen: DifferingListScreen(),
  ),
  Route(
    route: '/dismissable',
    screen: DismissableScreen(),
  ),
  Route(
    route: '/draggable-card',
    screen: DraggableCardScreen(),
  ),
  Route(
    route: '/drawer',
    screen: DrawerScreen(),
  ),
  Route(
    route: '/fade-image',
    screen: FadeImageScreen(),
  ),
  Route(
    route: '/fade-io',
    screen: FileIOScreen(),
  ),
  Route(
    route: '/form-validation',
    screen: FormValidationScreen(),
  ),
  Route(
    route: '/gridview',
    screen: GridviewScreen(),
  ),
  Route(
    route: '/keyvalue-store',
    screen: KeyValueStoreScreen(),
  ),
  Route(
    route: '/layout',
    screen: LayoutScreen(),
  ),
  Route(
    route: '/listview',
    screen: ListViewScreen(),
  ),
  Route(
    route: '/listview-builder',
    screen: ListViewBuilderScreen(),
  ),
  Route(
    route: '/navigate',
    screen: NavigateScreen(),
  ),
  Route(
    route: '/navigate-arguments',
    screen: NavigateArgumentsScreen(),
  ),
  Route(
    route: '/navigate-named',
    screen: NavigateNamedScreen(),
  ),
  Route(
    route: '/navigate-named-second',
    screen: NavigateNamedSecondScreen(),
  ),
  Route(
    route: '/navigate-return-data',
    screen: NavigateReturnDataScreen(),
  ),
  Route(
    route: '/navigate-send-data',
    screen: NavigateSendDataScreen(),
  ),
  Route(
    route: '/network-get-data',
    screen: NetworkGetDataScreen(),
  ),
  Route(
    route: '/network-get-large-data',
    screen: NetworkGetLargeDataScreen(),
  ),
  Route(
    route: '/network-send-data',
    screen: NetworkSendDataScreen(),
  ),
  Route(
    route: '/orientation',
    screen: OrientationChangeScreen(),
  ),
  Route(
    route: '/shopping-list',
    screen: ShoppingListScreen(),
  ),
  Route(
    route: '/sliverlist',
    screen: SliverListScreen(),
  ),
  Route(
    route: '/snackbar',
    screen: SnackBarScreen(),
  ),
  Route(
    route: '/tabs',
    screen: TabsScreen(),
  ),
  Route(
    route: '/widget-fade',
    screen: WidgetFadeScreen(),
  ),
];

// Generate application routes
Map<String, Widget Function(BuildContext)> generateApplicationRoutes() {
  Map<String, Widget Function(BuildContext)> applicationRoutes = {};

  myRoutes.forEach((myRoute) {
    applicationRoutes[myRoute.route] = (context) => myRoute.screen;
  });

  return applicationRoutes;
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        // Default font family.
        fontFamily: 'Open Sans',

        // Default text theme.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 15.0, fontFamily: 'Open Sans'),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Open Sans'),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.grey,
          primaryVariant: Colors.grey[600],
          onPrimary: Colors.white,
          secondary: Colors.blueGrey[700],
          secondaryVariant: Colors.blueGrey[900],
          onSecondary: Colors.white,
          error: Colors.orange[100],
          onError: Colors.black,
          background: Colors.grey[800],
          onBackground: Colors.white,
          onSurface: Colors.black,
          surface: Colors.grey[400],
        ),
      ),
      initialRoute: '/',
      routes: generateApplicationRoutes(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  static String description = 'Lists all other screens that contain examples';

  // Build list of links to screens
  List<Widget> buildScreenList(BuildContext context) {
    List<Widget> routeList = [];
    myRoutes.forEach((myRoute) {
      // Skip '/' root route
      if (myRoute.route == '/') {
        return;
      }
      routeList.add(
        Container(
          margin: EdgeInsets.fromLTRB(18, 2, 18, 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          height: 50,
          child: ElevatedButton(
            onPressed: () => {Navigator.of(context).pushNamed(myRoute.route)},
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 3, 0, 1),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${myRoute.route}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 1, 0, 3),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${myRoute.description ?? ""}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16, 60, 10, 10),
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
                'An ever growing list of screens exploring the Flutter library.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
