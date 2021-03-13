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
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: _openEndDrawer,
        child: Text('Code'),
      ),
    );
  }
}
