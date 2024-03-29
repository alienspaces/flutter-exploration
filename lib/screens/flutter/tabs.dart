import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flutter/tabs_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class TabsScreen extends StatelessWidget {
  static String name = 'Tabs';
  static String description = 'A simple TabBar with Tabs';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        // Common application bar
        appBar: AppBar(
          title: Text(TabsScreen.name),
          actions: <Widget>[
            // Open source code
            OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bus)),
            ],
          ),
        ),
        // Common screen list drawer
        drawer: ScreenListDrawerWidget(),
        // Common source code drawer
        endDrawer: SourceDrawerWidget(
          scaffoldKey: _scaffoldKey,
          sourceWidget: SourceWidget(),
        ),
        // Common screen body containing example
        body: ScreenBodyWidget(
          child: TabBarView(
            children: [
              Text('Car'),
              Text('Bicycle'),
              Text('Bus'),
            ],
          ),
        ),
      ),
    );
  }
}
