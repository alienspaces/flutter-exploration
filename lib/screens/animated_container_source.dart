import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';
import \'dart:math\';

// Application packages
import \'package:flutterexploration/screens/animated_container_source.dart\';

class AnimatedContainerScreen extends StatefulWidget {
  static String name = \'Animated Container\';
  static String description = \'Randomly adjust the properties of an AnimatedContainer\';

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Animated Container\'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
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
            Expanded(
              flex: 1,
              child: Container(
                child: SourceWidget(),
              ),
            ),
          ],
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

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        padding: EdgeInsets.all(12),
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
