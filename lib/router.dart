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
  bool hide;
  Widget screen;
  bool isDefault;

  RouteConfig({this.name, this.description, this.hide, this.screen, this.isDefault = false});
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
        hide: HomeScreen.hide,
        screen: HomeScreen(),
        isDefault: true,
      ),
      RouteConfig(
        name: AnimatedContainerScreen.name,
        description: AnimatedContainerScreen.description,
        hide: AnimatedContainerScreen.hide,
        screen: AnimatedContainerScreen(),
      ),
      RouteConfig(
        name: AnimatedRouteScreen.name,
        description: AnimatedRouteScreen.description,
        hide: AnimatedRouteScreen.hide,
        screen: AnimatedRouteScreen(),
      ),
      RouteConfig(
        name: ButtonRippleScreen.name,
        description: ButtonRippleScreen.description,
        hide: ButtonRippleScreen.hide,
        screen: ButtonRippleScreen(),
      ),
      RouteConfig(
        name: CounterScreen.name,
        description: CounterScreen.description,
        hide: CounterScreen.hide,
        screen: CounterScreen(),
      ),
      RouteConfig(
        name: DifferingListScreen.name,
        description: DifferingListScreen.description,
        hide: DifferingListScreen.hide,
        screen: DifferingListScreen(),
      ),
      RouteConfig(
        name: DismissableScreen.name,
        description: DismissableScreen.description,
        hide: DismissableScreen.hide,
        screen: DismissableScreen(),
      ),
      RouteConfig(
        name: DraggableCardScreen.name,
        description: DraggableCardScreen.description,
        hide: DraggableCardScreen.hide,
        screen: DraggableCardScreen(),
      ),
      RouteConfig(
        name: FadeImageScreen.name,
        description: FadeImageScreen.description,
        hide: FadeImageScreen.hide,
        screen: FadeImageScreen(),
      ),
      RouteConfig(
        name: FileIOScreen.name,
        description: FileIOScreen.description,
        hide: FileIOScreen.hide,
        screen: FileIOScreen(),
      ),
      RouteConfig(
        name: FormValidationScreen.name,
        description: FormValidationScreen.description,
        hide: FormValidationScreen.hide,
        screen: FormValidationScreen(),
      ),
      RouteConfig(
        name: GridviewScreen.name,
        description: GridviewScreen.description,
        hide: GridviewScreen.hide,
        screen: GridviewScreen(),
      ),
      RouteConfig(
        name: KeyValueStoreScreen.name,
        description: KeyValueStoreScreen.description,
        hide: KeyValueStoreScreen.hide,
        screen: KeyValueStoreScreen(),
      ),
      RouteConfig(
        name: LayoutScreen.name,
        description: LayoutScreen.description,
        hide: LayoutScreen.hide,
        screen: LayoutScreen(),
      ),
      RouteConfig(
        name: ListViewScreen.name,
        description: ListViewScreen.description,
        hide: ListViewScreen.hide,
        screen: ListViewScreen(),
      ),
      RouteConfig(
        name: ListViewBuilderScreen.name,
        description: ListViewBuilderScreen.description,
        hide: ListViewBuilderScreen.hide,
        screen: ListViewBuilderScreen(),
      ),
      RouteConfig(
        name: NavigateScreen.name,
        description: NavigateScreen.description,
        hide: NavigateScreen.hide,
        screen: NavigateScreen(),
      ),
      RouteConfig(
        name: NavigateArgumentsScreen.name,
        description: NavigateArgumentsScreen.description,
        hide: NavigateArgumentsScreen.hide,
        screen: NavigateArgumentsScreen(),
      ),
      RouteConfig(
        name: NavigateNamedScreen.name,
        description: NavigateNamedScreen.description,
        hide: NavigateNamedScreen.hide,
        screen: NavigateNamedScreen(),
      ),
      RouteConfig(
        name: NavigateNamedSecondScreen.name,
        description: NavigateNamedSecondScreen.description,
        hide: NavigateNamedSecondScreen.hide,
        screen: NavigateNamedSecondScreen(),
      ),
      RouteConfig(
        name: NavigateReturnDataScreen.name,
        description: NavigateReturnDataScreen.description,
        hide: NavigateReturnDataScreen.hide,
        screen: NavigateReturnDataScreen(),
      ),
      RouteConfig(
        name: NavigateSendDataScreen.name,
        description: NavigateSendDataScreen.description,
        hide: NavigateSendDataScreen.hide,
        screen: NavigateSendDataScreen(),
      ),
      RouteConfig(
        name: NetworkGetDataScreen.name,
        description: NetworkGetDataScreen.description,
        hide: NetworkGetDataScreen.hide,
        screen: NetworkGetDataScreen(),
      ),
      RouteConfig(
        name: NetworkGetLargeDataScreen.name,
        description: NetworkGetLargeDataScreen.description,
        hide: NetworkGetLargeDataScreen.hide,
        screen: NetworkGetLargeDataScreen(),
      ),
      RouteConfig(
        name: NetworkSendDataScreen.name,
        description: NetworkSendDataScreen.description,
        hide: NetworkSendDataScreen.hide,
        screen: NetworkSendDataScreen(),
      ),
      RouteConfig(
        name: OrientationChangeScreen.name,
        description: OrientationChangeScreen.description,
        hide: OrientationChangeScreen.hide,
        screen: OrientationChangeScreen(),
      ),
      RouteConfig(
        name: ShoppingListScreen.name,
        description: ShoppingListScreen.description,
        hide: ShoppingListScreen.hide,
        screen: ShoppingListScreen(),
      ),
      RouteConfig(
        name: SliverListScreen.name,
        description: SliverListScreen.description,
        hide: SliverListScreen.hide,
        screen: SliverListScreen(),
      ),
      RouteConfig(
        name: SnackBarScreen.name,
        description: SnackBarScreen.description,
        hide: SnackBarScreen.hide,
        screen: SnackBarScreen(),
      ),
      RouteConfig(
        name: TabsScreen.name,
        description: TabsScreen.description,
        hide: TabsScreen.hide,
        screen: TabsScreen(),
      ),
      RouteConfig(
        name: WidgetFadeScreen.name,
        description: WidgetFadeScreen.description,
        hide: WidgetFadeScreen.hide,
        screen: WidgetFadeScreen(),
      ),
    ],
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
