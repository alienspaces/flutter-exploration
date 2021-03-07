import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static String name = 'Counter';
  static String description = 'Scaffold with a counter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // Example AppBar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        textTheme: Theme.of(context).textTheme,
        leading: IconButton(
          icon: Icon(Icons.backspace_rounded),
          color: Theme.of(context).colorScheme.onPrimary,
          tooltip: 'Navigation menu',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Example AppBar Navigation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            disabledColor: Theme.of(context).colorScheme.onPrimary.withAlpha(128),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        // Counter widget is imported from our application widgets library
        child: Counter(),
      ),
      // Example FloatingActionButton
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
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
    return Text('Count: $count');
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
      child: Text('Increment Count'),
    );
  }
}

/// Counter demonstrates a StatefulWidget that passes
/// its state to child widgets.
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
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
