import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/gridview_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class GridviewScreen extends StatelessWidget {
  static String name = 'GridView';
  static String description = 'A simple GridView';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(GridviewScreen.name),
        actions: <Widget>[
          // Open source code
          OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
        ],
      ),
      // Common screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Common source code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Example
      body: ScreenBodyWidget(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            100,
            (index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.yellow,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
