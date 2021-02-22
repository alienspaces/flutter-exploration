import 'package:flutter/material.dart';

class NavigateArgumentsScreen extends StatelessWidget {
  static String name = 'Navigate Arguments';
  static String description = 'Pass arguments when routing';

  static const routeName = '/navigate-arguments';

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
                  NavigateArgumentsScreen.routeName,
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
