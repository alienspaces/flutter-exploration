import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  static String name = 'Drawer';
  static String description = 'Scaffold with a Drawer';

  final String title = 'Drawer';

  DrawerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backspace_rounded),
            color: Theme.of(context).colorScheme.onPrimary,
            tooltip: 'Search',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ListTile(
              title: Text('Click me'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Or me'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('And me!'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
