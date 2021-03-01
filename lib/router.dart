/// Define RouteCategory(ies), RouteConfig(s) and screens here and they will
/// be added to the list of screens displayed on the home page
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

/// Defines a category of route
class RouteCategory {
  String name;
  String description;
  List<RouteConfig> routes;

  RouteCategory({this.name, this.description, this.routes});
}

/// Defines a route
class RouteConfig {
  String name;
  String description;
  Widget screen;
  bool isDefault;

  RouteConfig({this.name, this.description, this.screen, this.isDefault = false});
}

/// Converts a given string to snake-case for usage as a Flutter route
String toSnakeCase(String str) {
  return str
      .replaceAllMapped(
          RegExp(r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
          (Match m) => "${m[0].toLowerCase()}")
      .replaceAll(RegExp(r'(-|\s)+'), '_');
}

List<RouteCategory> routeCategories = [
  RouteCategory(
    name: 'Flutter Core',
    description: 'Examples using standard Flutter widgets',
    routes: [
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
        name: CounterScreen.name,
        description: CounterScreen.description,
        screen: CounterScreen(),
      ),
      RouteConfig(
        name: DifferingListScreen.name,
        description: DifferingListScreen.description,
        screen: DifferingListScreen(),
      ),
      RouteConfig(
        name: DismissableScreen.name,
        description: DismissableScreen.description,
        screen: DismissableScreen(),
      ),
      RouteConfig(
        name: DraggableCardScreen.name,
        description: DraggableCardScreen.description,
        screen: DraggableCardScreen(),
      ),
      RouteConfig(
        name: DrawerScreen.name,
        description: DrawerScreen.description,
        screen: DrawerScreen(),
      ),
      RouteConfig(
        name: FadeImageScreen.name,
        description: FadeImageScreen.description,
        screen: FadeImageScreen(),
      ),
      RouteConfig(
        name: FileIOScreen.name,
        description: FileIOScreen.description,
        screen: FileIOScreen(),
      ),
      RouteConfig(
        name: FormValidationScreen.name,
        description: FormValidationScreen.description,
        screen: FormValidationScreen(),
      ),
      RouteConfig(
        name: GridviewScreen.name,
        description: GridviewScreen.description,
        screen: GridviewScreen(),
      ),
      RouteConfig(
        name: KeyValueStoreScreen.name,
        description: KeyValueStoreScreen.description,
        screen: KeyValueStoreScreen(),
      ),
      RouteConfig(
        name: LayoutScreen.name,
        description: LayoutScreen.description,
        screen: LayoutScreen(),
      ),
      RouteConfig(
        name: ListViewScreen.name,
        description: ListViewScreen.description,
        screen: ListViewScreen(),
      ),
      RouteConfig(
        name: ListViewBuilderScreen.name,
        description: ListViewBuilderScreen.description,
        screen: ListViewBuilderScreen(),
      ),
      RouteConfig(
        name: NavigateScreen.name,
        description: NavigateScreen.description,
        screen: NavigateScreen(),
      ),
      RouteConfig(
        name: NavigateArgumentsScreen.name,
        description: NavigateArgumentsScreen.description,
        screen: NavigateArgumentsScreen(),
      ),
      RouteConfig(
        name: NavigateNamedScreen.name,
        description: NavigateNamedScreen.description,
        screen: NavigateNamedScreen(),
      ),
      RouteConfig(
        name: NavigateReturnDataScreen.name,
        description: NavigateReturnDataScreen.description,
        screen: NavigateReturnDataScreen(),
      ),
      RouteConfig(
        name: NavigateSendDataScreen.name,
        description: NavigateSendDataScreen.description,
        screen: NavigateSendDataScreen(),
      ),
      RouteConfig(
        name: NetworkGetDataScreen.name,
        description: NetworkGetDataScreen.description,
        screen: NetworkGetDataScreen(),
      ),
      RouteConfig(
        name: NetworkGetLargeDataScreen.name,
        description: NetworkGetLargeDataScreen.description,
        screen: NetworkGetLargeDataScreen(),
      ),
      RouteConfig(
        name: NetworkSendDataScreen.name,
        description: NetworkSendDataScreen.description,
        screen: NetworkSendDataScreen(),
      ),
      RouteConfig(
        name: OrientationChangeScreen.name,
        description: OrientationChangeScreen.description,
        screen: OrientationChangeScreen(),
      ),
      RouteConfig(
        name: ShoppingListScreen.name,
        description: ShoppingListScreen.description,
        screen: ShoppingListScreen(),
      ),
      RouteConfig(
        name: SliverListScreen.name,
        description: SliverListScreen.description,
        screen: SliverListScreen(),
      ),
      RouteConfig(
        name: SnackBarScreen.name,
        description: SnackBarScreen.description,
        screen: SnackBarScreen(),
      ),
      RouteConfig(
        name: TabsScreen.name,
        description: TabsScreen.description,
        screen: TabsScreen(),
      ),
      RouteConfig(
        name: WidgetFadeScreen.name,
        description: WidgetFadeScreen.description,
        screen: WidgetFadeScreen(),
      ),
    ],
  ),
];

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
    name: CounterScreen.name,
    description: CounterScreen.description,
    screen: CounterScreen(),
  ),
  RouteConfig(
    name: DifferingListScreen.name,
    description: DifferingListScreen.description,
    screen: DifferingListScreen(),
  ),
  RouteConfig(
    name: DismissableScreen.name,
    description: DismissableScreen.description,
    screen: DismissableScreen(),
  ),
  RouteConfig(
    name: DraggableCardScreen.name,
    description: DraggableCardScreen.description,
    screen: DraggableCardScreen(),
  ),
  RouteConfig(
    name: DrawerScreen.name,
    description: DrawerScreen.description,
    screen: DrawerScreen(),
  ),
  RouteConfig(
    name: FadeImageScreen.name,
    description: FadeImageScreen.description,
    screen: FadeImageScreen(),
  ),
  RouteConfig(
    name: FileIOScreen.name,
    description: FileIOScreen.description,
    screen: FileIOScreen(),
  ),
  RouteConfig(
    name: FormValidationScreen.name,
    description: FormValidationScreen.description,
    screen: FormValidationScreen(),
  ),
  RouteConfig(
    name: GridviewScreen.name,
    description: GridviewScreen.description,
    screen: GridviewScreen(),
  ),
  RouteConfig(
    name: KeyValueStoreScreen.name,
    description: KeyValueStoreScreen.description,
    screen: KeyValueStoreScreen(),
  ),
  RouteConfig(
    name: LayoutScreen.name,
    description: LayoutScreen.description,
    screen: LayoutScreen(),
  ),
  RouteConfig(
    name: ListViewScreen.name,
    description: ListViewScreen.description,
    screen: ListViewScreen(),
  ),
  RouteConfig(
    name: ListViewBuilderScreen.name,
    description: ListViewBuilderScreen.description,
    screen: ListViewBuilderScreen(),
  ),
  RouteConfig(
    name: NavigateScreen.name,
    description: NavigateScreen.description,
    screen: NavigateScreen(),
  ),
  RouteConfig(
    name: NavigateArgumentsScreen.name,
    description: NavigateArgumentsScreen.description,
    screen: NavigateArgumentsScreen(),
  ),
  RouteConfig(
    name: NavigateNamedScreen.name,
    description: NavigateNamedScreen.description,
    screen: NavigateNamedScreen(),
  ),
  RouteConfig(
    name: NavigateReturnDataScreen.name,
    description: NavigateReturnDataScreen.description,
    screen: NavigateReturnDataScreen(),
  ),
  RouteConfig(
    name: NavigateSendDataScreen.name,
    description: NavigateSendDataScreen.description,
    screen: NavigateSendDataScreen(),
  ),
  RouteConfig(
    name: NetworkGetDataScreen.name,
    description: NetworkGetDataScreen.description,
    screen: NetworkGetDataScreen(),
  ),
  RouteConfig(
    name: NetworkGetLargeDataScreen.name,
    description: NetworkGetLargeDataScreen.description,
    screen: NetworkGetLargeDataScreen(),
  ),
  RouteConfig(
    name: NetworkSendDataScreen.name,
    description: NetworkSendDataScreen.description,
    screen: NetworkSendDataScreen(),
  ),
  RouteConfig(
    name: OrientationChangeScreen.name,
    description: OrientationChangeScreen.description,
    screen: OrientationChangeScreen(),
  ),
  RouteConfig(
    name: ShoppingListScreen.name,
    description: ShoppingListScreen.description,
    screen: ShoppingListScreen(),
  ),
  RouteConfig(
    name: SliverListScreen.name,
    description: SliverListScreen.description,
    screen: SliverListScreen(),
  ),
  RouteConfig(
    name: SnackBarScreen.name,
    description: SnackBarScreen.description,
    screen: SnackBarScreen(),
  ),
  RouteConfig(
    name: TabsScreen.name,
    description: TabsScreen.description,
    screen: TabsScreen(),
  ),
  RouteConfig(
    name: WidgetFadeScreen.name,
    description: WidgetFadeScreen.description,
    screen: WidgetFadeScreen(),
  ),
];

/// Returns a list of all configured routes
Map<String, Widget Function(BuildContext)> getRoutes() {
  Map<String, Widget Function(BuildContext)> applicationRouteConfigs = {};

  routeCategories.forEach((routeCategory) {
    routeCategory.routes.forEach((route) {
      applicationRouteConfigs[toSnakeCase(route.name)] = (context) => route.screen;
    });
  });

  return applicationRouteConfigs;
}

/// Returns the first configured default route
RouteConfig getDefaultRoute() {
  for (var categoryIdx = 0; categoryIdx < routeCategories.length; categoryIdx++) {
    var routeCategory = routeCategories[categoryIdx];
    for (var routeIdx = 0; routeIdx < routeCategory.routes.length; routeIdx++) {
      if (routeCategory.routes[routeIdx].isDefault) {
        return routeCategory.routes[routeIdx];
      }
    }
  }

  return null;
}
