import 'package:flutter/material.dart';

class OpenSourceDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  OpenSourceDrawerWidget({Key key, this.scaffoldKey}) : super(key: key);

  void _openEndDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          //   minimumSize: Size.fromHeight(30),
        ),
        onPressed: _openEndDrawer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.code),
            Text('Code'),
          ],
        ),
      ),
    );
  }
}
