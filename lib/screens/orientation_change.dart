import 'package:flutter/material.dart';

class OrientationChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change items per row by adjusting orientation'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'Thing $index',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
