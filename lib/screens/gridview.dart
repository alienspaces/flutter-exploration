import 'package:flutter/material.dart';

class GridviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                  color: Colors.yellow,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          );
        }),
      ),
    );
  }
}
