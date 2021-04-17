import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flutter/animated_route_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class AnimatedRouteScreen extends StatelessWidget {
  static String name = 'Animated Route';
  static String description = 'Slide transition between two pages';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(AnimatedRouteScreen.name),
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
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: <Widget>[
              // Scroll vertically
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  // Space buttons evenly in horizontal space
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Animated from page bottom
                    Container(
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                          minimumSize: Size.square(200),
                        ),
                        child: Text(
                          'From Bottom',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_animatedFromBottomRoute());
                        },
                      ),
                    ),
                    // Animated from page top
                    Container(
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                          minimumSize: Size.square(200),
                        ),
                        child: Text(
                          'From Top',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_animatedFromTopRoute());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Scroll horizontally
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  // Space buttons evenly in horizontal space
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Animated from page left
                    Container(
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                          minimumSize: Size.square(200),
                        ),
                        child: Text(
                          'From Left',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_animatedFromLeftRoute());
                        },
                      ),
                    ),
                    // Animated from page right
                    Container(
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                          minimumSize: Size.square(200),
                        ),
                        child: Text(
                          'From Right',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_animatedFromRightRoute());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _animatedFromBottomRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Creates an offset. The first argument sets [dx], the horizontal component,
      // and the second sets [dy], the vertical component.
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

Route _animatedFromTopRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Creates an offset. The first argument sets [dx], the horizontal component,
      // and the second sets [dy], the vertical component.
      var begin = Offset(0.0, -1);
      var end = Offset.zero;
      var curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

Route _animatedFromLeftRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Creates an offset. The first argument sets [dx], the horizontal component,
      // and the second sets [dy], the vertical component.
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

Route _animatedFromRightRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Creates an offset. The first argument sets [dx], the horizontal component,
      // and the second sets [dy], the vertical component.
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              child: Text('Second Page', style: Theme.of(context).textTheme.headline4),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 140,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Return'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
