import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/counter_source.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class CounterScreen extends StatelessWidget {
  static String name = \'Counter\';
  static String description = \'Scaffold with a counter\';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(CounterScreen.name),
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
      body: Center(
        // Counter widget is imported from our application widgets library
        child: CounterWidget(),
      ),
      // Example FloatingActionButton
      floatingActionButton: FloatingActionButton(
        tooltip: \'Add\',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

/// CounterDisplay demonstrates a StatelessWidget that
/// accepts the current count.
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(\'Count: \$count\');
  }
}

/// CounterIncrementer demonstrates a StatelessWidget that
/// accepts a function callback.
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        ),
        shadowColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondaryVariant,
        ),
      ),
      onPressed: onPressed,
      child: Text(\'Increment Count\'),
    );
  }
}

/// Counter demonstrates a StatefulWidget that passes
/// its state to child widgets.
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Callback function that increments the count is passed to child widget
          CounterIncrementor(onPressed: _increment),
          // Current count is passed to child widget
          CounterDisplay(count: _counter),
        ],
      ),
    );
  }
}

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
