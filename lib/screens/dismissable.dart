import 'package:flutter/material.dart';

class DismissableScreen extends StatelessWidget {
  static String name = 'Dismissable List';
  static String description = 'ListView with Dismissable items';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissable List Thinger'),
      ),
      body: DismissibleList(),
    );
  }
}

class DismissibleList extends StatefulWidget {
  DismissibleList({Key key}) : super(key: key);

  @override
  DismissibleListState createState() {
    return DismissibleListState();
  }
}

class DismissibleListState extends State<DismissibleList> {
  final items = List<String>.generate(30, (i) => "List item $i");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final item = items[index];
      return Dismissible(
        key: Key(item),
        onDismissed: (direction) {
          setState(() {
            items.removeAt(index);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$item dismissed'),
              ),
            );
          });
        },
        background: Container(color: Colors.red),
        child: ListTile(title: Text('$item')),
      );
    });
  }
}
