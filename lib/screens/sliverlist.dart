import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  static String name = 'Sliver List';
  static String description = 'A simple SliverList with SliverChildBuilderDelegate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom scroll view'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Floating app bar'),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
