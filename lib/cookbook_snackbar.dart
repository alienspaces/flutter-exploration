import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(title: Text('Apparently a snackbar?')),
      body: PageWidget(),
    );
  }
}

class PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
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
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
