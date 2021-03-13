import 'package:flutter/material.dart';

class SourceDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget sourceWidget;

  SourceDrawerWidget({Key key, this.scaffoldKey, this.sourceWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust font size based on screen width
    double width = MediaQuery.of(context).size.width;
    double containerWidth = width / 1.15;
    if (width > 2048) {
      containerWidth = width / 2;
    } else if (width > 1024) {
      containerWidth = width / 1.5;
    }

    return Container(
      width: containerWidth,
      child: Drawer(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Scrollbar(
              child: SingleChildScrollView(
                child: sourceWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
