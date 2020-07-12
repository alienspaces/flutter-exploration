import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final List<String> items = List<String>.generate(10000, (i) => "Item $i");
  HomeWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}
