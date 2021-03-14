import 'package:flutter/material.dart';
import 'dart:math';

// Application packages
import 'package:flutterexploration/screens/flutter/animated_container_source.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class AnimatedContainerScreen extends StatefulWidget {
  static String name = 'Animated Container';
  static String description = 'Randomly adjust the properties of an AnimatedContainer';
  static bool hide = false;

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(AnimatedContainerScreen.name),
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
      // Common screen body containing example
      body: ScreenBodyWidget(
        child: Container(
          alignment: Alignment.center,
          // Creates a container that animates its parameters implicitly.
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            // Set random width, height, colour and border radius
            final r = new Random();
            _width = r.nextInt(300).toDouble();
            _height = r.nextInt(300).toDouble();
            _color = Color.fromRGBO(
              r.nextInt(256),
              r.nextInt(256),
              r.nextInt(256),
              1,
            );
            _borderRadius = BorderRadius.circular(r.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
