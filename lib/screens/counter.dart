import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/widgets/counter/counter.dart';

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
