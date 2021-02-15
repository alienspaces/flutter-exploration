import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bus)),
            ],
          ),
          title: Text('TABS Example'),
        ),
        body: TabBarView(
          children: [
            Text('Car'),
            Text('Bicycle'),
            Text('Bus'),
          ],
        ),
      ),
    );
  }
}
