import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/home.dart';
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
  String name;
  String description;
  Widget screen;

  Route({this.name, this.description, this.screen});
}

List<Route> routes = [
  Route(
    name: '/',
    description: HomeScreen.description,
    screen: HomeScreen(),
  ),
  Route(
    name: '/animated-container',
    description: "Randomly adjust the properties of an AnimatedContainer",
    screen: AnimatedContainerScreen(),
  ),
  Route(
    name: '/animated-route',
    description: "Slide transition between two pages",
    screen: AnimatedRouteScreen(),
  ),
  Route(
    name: '/button-ripple',
    screen: ButtonRippleScreen(),
  ),
  Route(
    name: '/counter',
    screen: CounterScreen(),
  ),
  Route(
    name: '/differing-list',
    screen: DifferingListScreen(),
  ),
  Route(
    name: '/dismissable',
    screen: DismissableScreen(),
  ),
  Route(
    name: '/draggable-card',
    screen: DraggableCardScreen(),
  ),
  Route(
    name: '/drawer',
    screen: DrawerScreen(),
  ),
  Route(
    name: '/fade-image',
    screen: FadeImageScreen(),
  ),
  Route(
    name: '/fade-io',
    screen: FileIOScreen(),
  ),
  Route(
    name: '/form-validation',
    screen: FormValidationScreen(),
  ),
  Route(
    name: '/gridview',
    screen: GridviewScreen(),
  ),
  Route(
    name: '/keyvalue-store',
    screen: KeyValueStoreScreen(),
  ),
  Route(
    name: '/layout',
    screen: LayoutScreen(),
  ),
  Route(
    name: '/listview',
    screen: ListViewScreen(),
  ),
  Route(
    name: '/listview-builder',
    screen: ListViewBuilderScreen(),
  ),
  Route(
    name: '/navigate',
    screen: NavigateScreen(),
  ),
  Route(
    name: '/navigate-arguments',
    screen: NavigateArgumentsScreen(),
  ),
  Route(
    name: '/navigate-named',
    screen: NavigateNamedScreen(),
  ),
  Route(
    name: '/navigate-named-second',
    screen: NavigateNamedSecondScreen(),
  ),
  Route(
    name: '/navigate-return-data',
    screen: NavigateReturnDataScreen(),
  ),
  Route(
    name: '/navigate-send-data',
    screen: NavigateSendDataScreen(),
  ),
  Route(
    name: '/network-get-data',
    screen: NetworkGetDataScreen(),
  ),
  Route(
    name: '/network-get-large-data',
    screen: NetworkGetLargeDataScreen(),
  ),
  Route(
    name: '/network-send-data',
    screen: NetworkSendDataScreen(),
  ),
  Route(
    name: '/orientation',
    screen: OrientationChangeScreen(),
  ),
  Route(
    name: '/shopping-list',
    screen: ShoppingListScreen(),
  ),
  Route(
    name: '/sliverlist',
    screen: SliverListScreen(),
  ),
  Route(
    name: '/snackbar',
    screen: SnackBarScreen(),
  ),
  Route(
    name: '/tabs',
    screen: TabsScreen(),
  ),
  Route(
    name: '/widget-fade',
    screen: WidgetFadeScreen(),
  ),
];

// Generate application routes
Map<String, Widget Function(BuildContext)> getRoutes() {
  Map<String, Widget Function(BuildContext)> applicationRoutes = {};

  routes.forEach((route) {
    applicationRoutes[route.name] = (context) => route.screen;
  });

  return applicationRoutes;
}
