import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/widget_fade_source.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

Container fadingContainer = Container(
  width: 200.0,
  height: 200.0,
  color: Colors.green,
);

class WidgetFadeScreen extends StatefulWidget {
  static String name = \'Widget Fade\';
  static String description = \'Fade a widget in and out\';

  final String title;

  WidgetFadeScreen({Key key, this.title}) : super(key: key);

  @override
  _WidgetFadeScreenState createState() => _WidgetFadeScreenState();
}

class _WidgetFadeScreenState extends State<WidgetFadeScreen> {
  bool _visible = true;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(WidgetFadeScreen.name),
        actions: <Widget>[
          // Open source code
          OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
        ],
      ),
      // Screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Source Code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Example
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Row(
          children: [
            Text(\'Press the button to fad in and out\'),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: fadingContainer,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: \'Toggly Boggly\',
        child: Icon(Icons.flip),
      ),
    );
  }
}

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Theme.of(context).colorScheme.background,
      child: Expanded(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: HighlightView(
            "$textContent",
            language: 'dart',
            theme: githubTheme,
            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
