import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class DismissableScreen extends StatelessWidget {
  static String name = \'Dismissable List\';
  static String description = \'ListView with Dismissable items\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Dismissable List Thinger\'),
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
  final items = List<String>.generate(30, (i) => "List item \$i");
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
                content: Text(\'\$item dismissed\'),
              ),
            );
          });
        },
        background: Container(color: Colors.red),
        child: ListTile(title: Text(\'\$item\')),
      );
    });
  }
}

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        padding: EdgeInsets.all(12),
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
