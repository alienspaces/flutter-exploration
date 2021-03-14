import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flutter/dismissable_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class DismissableScreen extends StatelessWidget {
  static String name = 'Dismissable List';
  static String description = 'ListView with Dismissable items';
  static bool hide = false;

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
      // Common screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Common source code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Common screen body containing example
      body: ScreenBodyWidget(
        child: DismissibleList(),
      ),
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
