import 'package:flutter/material.dart';

class SourceDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget sourceWidget;

  SourceDrawerWidget({Key key, this.scaffoldKey, this.sourceWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _closeEndDrawer() {
      Navigator.of(context).pop();
    }

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        Scrollbar(
          child: SingleChildScrollView(
            child: sourceWidget,
          ),
        ),
        Container(
          width: 100,
          height: 50,
          child: ElevatedButton(
            onPressed: _closeEndDrawer,
            child: const Text('Hide Code'),
          ),
        ),
      ],
    );
  }
}
