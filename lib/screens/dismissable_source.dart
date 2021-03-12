import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/dismissable_source.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class DismissableScreen extends StatelessWidget {
  static String name = \'Dismissable List\';
  static String description = \'ListView with Dismissable items\';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(DismissableScreen.name),
        actions: <Widget>[
          // Open source code
          OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
        ],
      ),
      // Screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Source Code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Example
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
      alignment: Alignment.topLeft,
      color: Theme.of(context).colorScheme.background,
      child: Expanded(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: HighlightView(
            "$textContent",
            language: 'dart',
            theme: githubTheme,
            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
