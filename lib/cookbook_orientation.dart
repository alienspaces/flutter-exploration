import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Orientation by adjusting the size of the viewport'),
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
