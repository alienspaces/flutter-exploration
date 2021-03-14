import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

// Application packages
import 'package:flutterexploration/theme.dart';
import 'package:flutterexploration/router.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // Required for numerous packages
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  build(BuildContext context) {
    var defaultRoute = getDefaultRoute();
    if (defaultRoute == null) {
      throw 'Default route not configured, cannot continue';
    }

    return MaterialApp(
      theme: getTheme(context),
      initialRoute: toSnakeCase(defaultRoute.name),
      routes: getRoutes(),
    );
  }
}
