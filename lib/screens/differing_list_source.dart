import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class DifferingListScreen extends StatelessWidget {
  static String name = \'Differing List\';
  static String description = \'ListView with ListTiles\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Different types of list items\'),
      ),
      body: ListWidget(),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
  Widget buildTitle(BuildContext context) => Text(sender);
  Widget buildSubtitle(BuildContext context) => Text(body);
}

class ListWidget extends StatelessWidget {
  final items = List<ListItem>.generate(
    1200,
    (i) => i % 6 == 0 ? HeadingItem("Heading \$i") : MessageItem("Sender \$i", "Message body \$i"),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      },
    );
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
