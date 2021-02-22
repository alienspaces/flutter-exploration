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

/// Define RouteConfigs and screens here and they will automatically be
/// added to the list of screens displayed on the home page

class RouteConfig {
  String name;
  String description;
  Widget screen;
  bool isDefault;

  RouteConfig({this.name, this.description, this.screen, this.isDefault = false});

  static String toSnakeCase(String str) {
    return str
        .replaceAllMapped(
            RegExp(r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
            (Match m) => "${m[0].toLowerCase()}")
        .replaceAll(RegExp(r'(-|\s)+'), '_');
  }
}

List<RouteConfig> routes = [
  RouteConfig(
    name: HomeScreen.name,
    description: HomeScreen.description,
    screen: HomeScreen(),
    isDefault: true,
  ),
  RouteConfig(
    name: AnimatedContainerScreen.name,
    description: AnimatedContainerScreen.description,
    screen: AnimatedContainerScreen(),
  ),
  RouteConfig(
    name: AnimatedRouteScreen.name,
    description: AnimatedRouteScreen.description,
    screen: AnimatedRouteScreen(),
  ),
  RouteConfig(
    name: ButtonRippleScreen.name,
    description: ButtonRippleScreen.description,
    screen: ButtonRippleScreen(),
  ),
  RouteConfig(
    name: '/counter',
    screen: CounterScreen(),
  ),
  RouteConfig(
    name: '/differing-list',
    screen: DifferingListScreen(),
  ),
  RouteConfig(
    name: '/dismissable',
    screen: DismissableScreen(),
  ),
  RouteConfig(
    name: '/draggable-card',
    screen: DraggableCardScreen(),
  ),
  RouteConfig(
    name: '/drawer',
    screen: DrawerScreen(),
  ),
  RouteConfig(
    name: '/fade-image',
    screen: FadeImageScreen(),
  ),
  RouteConfig(
    name: '/fade-io',
    screen: FileIOScreen(),
  ),
  RouteConfig(
    name: '/form-validation',
    screen: FormValidationScreen(),
  ),
  RouteConfig(
    name: '/gridview',
    screen: GridviewScreen(),
  ),
  RouteConfig(
    name: '/keyvalue-store',
    screen: KeyValueStoreScreen(),
  ),
  RouteConfig(
    name: '/layout',
    screen: LayoutScreen(),
  ),
  RouteConfig(
    name: '/listview',
    screen: ListViewScreen(),
  ),
  RouteConfig(
    name: '/listview-builder',
    screen: ListViewBuilderScreen(),
  ),
  RouteConfig(
    name: '/navigate',
    screen: NavigateScreen(),
  ),
  RouteConfig(
    name: '/navigate-arguments',
    screen: NavigateArgumentsScreen(),
  ),
  RouteConfig(
    name: '/navigate-named',
    screen: NavigateNamedScreen(),
  ),
  RouteConfig(
    name: '/navigate-named-second',
    screen: NavigateNamedSecondScreen(),
  ),
  RouteConfig(
    name: '/navigate-return-data',
    screen: NavigateReturnDataScreen(),
  ),
  RouteConfig(
    name: '/navigate-send-data',
    screen: NavigateSendDataScreen(),
  ),
  RouteConfig(
    name: '/network-get-data',
    screen: NetworkGetDataScreen(),
  ),
  RouteConfig(
    name: '/network-get-large-data',
    screen: NetworkGetLargeDataScreen(),
  ),
  RouteConfig(
    name: '/network-send-data',
    screen: NetworkSendDataScreen(),
  ),
  RouteConfig(
    name: '/orientation',
    screen: OrientationChangeScreen(),
  ),
  RouteConfig(
    name: '/shopping-list',
    screen: ShoppingListScreen(),
  ),
  RouteConfig(
    name: '/sliverlist',
    screen: SliverListScreen(),
  ),
  RouteConfig(
    name: '/snackbar',
    screen: SnackBarScreen(),
  ),
  RouteConfig(
    name: '/tabs',
    screen: TabsScreen(),
  ),
  RouteConfig(
    name: '/widget-fade',
    screen: WidgetFadeScreen(),
  ),
];

// Generate application RouteConfigs
Map<String, Widget Function(BuildContext)> getRoutes() {
  Map<String, Widget Function(BuildContext)> applicationRouteConfigs = {};

  routes.forEach((route) {
    applicationRouteConfigs[RouteConfig.toSnakeCase(route.name)] = (context) => route.screen;
  });

  return applicationRouteConfigs;
}

// Generate application RouteConfigs
RouteConfig getDefaultRoute() {
  for (var i = 0; i < routes.length; i++) {
    if (routes[i].isDefault) {
      return routes[i];
    }
  }

  return null;
}
