import 'package:flutter/material.dart';

/// Common base screen body layout
class ScreenBodyWidget extends StatelessWidget {
  final Widget child;

  ScreenBodyWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: child,
      ),
    );
  }
}
