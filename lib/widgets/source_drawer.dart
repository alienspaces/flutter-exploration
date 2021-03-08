import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/widgets/close_source_drawer.dart';

class SourceDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget sourceWidget;

  SourceDrawerWidget({Key key, this.scaffoldKey, this.sourceWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Drawer(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Scrollbar(
              child: SingleChildScrollView(
                child: sourceWidget,
              ),
            ),
            CloseSourceDrawerWidget(
              scaffoldKey: scaffoldKey,
            ),
          ],
        ),
      ),
    );
  }
}
