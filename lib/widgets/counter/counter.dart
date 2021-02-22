import 'package:flutter/material.dart';

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
