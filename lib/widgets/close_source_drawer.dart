import 'package:flutter/material.dart';

class CloseSourceDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  CloseSourceDrawerWidget({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _closeEndDrawer() {
      Navigator.of(context).pop();
    }

    return Container(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: _closeEndDrawer,
        child: Text('Hide Code'),
      ),
    );
  }
}
