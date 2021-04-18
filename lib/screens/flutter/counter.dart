import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flutter/counter_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class CounterScreen extends StatelessWidget {
  static String name = 'Counter';
  static String description = 'Scaffold with a counter';
  static bool hide = false;

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
      // Common screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Common source code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Common screen body containing example
      body: ScreenBodyWidget(
        child: Center(
          child: CounterWidget(),
        ),
      ),
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
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Callback function that increments the count
          CounterIncrement(onPressed: _increment),
          // Current count is passed to child widget
          CounterDisplay(count: _counter),
          // Callback function that decrements the count
          CounterDecrement(onPressed: _decrement),
        ],
      ),
    );
  }
}

/// CounterDisplay is a StatelessWidget that accepts the current count.
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: 190,
      height: 190,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondaryVariant),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text('Count: $count'),
    );
  }
}

/// CounterIncrement is a StatelessWidget that accepts a function callback.
class CounterIncrement extends StatelessWidget {
  CounterIncrement({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.secondary,
        minimumSize: Size.square(200),
      ),
      onPressed: onPressed,
      child: Text(
        'Increment Count',
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      ),
    );
  }
}

/// CounterDecrement is a StatelessWidget that accepts a function callback.
class CounterDecrement extends StatelessWidget {
  CounterDecrement({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.secondary,
        minimumSize: Size.square(200),
      ),
      onPressed: onPressed,
      child: Text(
        'Decrement Count',
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      ),
    );
  }
}
