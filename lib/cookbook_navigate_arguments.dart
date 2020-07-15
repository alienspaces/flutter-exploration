import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args != null ? args.title : 'No args title'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            heightFactor: 10.0,
            child: Text(args != null ? args.message : 'No args message'),
          ),
          Center(
            child: RaisedButton(
              child: Text('Navigate to myself and extract arguments'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomeWidget.routeName,
                  arguments: ScreenArguments(
                    'Boo!!',
                    'Hahahaha :D',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
