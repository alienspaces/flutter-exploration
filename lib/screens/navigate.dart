import 'package:flutter/material.dart';

class NavigateScreen extends StatelessWidget {
  static String name = 'Navigate';
  static String description = 'Simple navigation between screens';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SecondScreen();
          }));
        },
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/en/e/ed/G1-3_Against_the_Giants.jpg',
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/T1ModuleCover.jpg/200px-T1ModuleCover.jpg',
          ),
        ),
      ),
    );
  }
}
