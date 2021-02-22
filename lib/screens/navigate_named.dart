import 'package:flutter/material.dart';

class NavigateNamedScreen extends StatelessWidget {
  static String name = 'Naviagate Named';
  static String description = 'Navigate to a named route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch Screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/navigate-named-second');
          },
        ),
      ),
    );
  }
}

class NavigateNamedSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Back!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
