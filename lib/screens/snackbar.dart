import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static String name = 'SnackBar';
  static String description = 'A simple SnackBar with a SnackBarAction';

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(title: Text('Apparently a snackbar?')),
      body: SnackBarBodyWidget(),
    );
  }
}

class SnackBarBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A Snackbar?!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // some code here to do something
              },
            ),
            duration: Duration(seconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
