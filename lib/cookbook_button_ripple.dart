import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ripple\'n Widget'),
      ),
      body: Container(
        child: RippleButton(),
      ),
    );
  }
}

class RippleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Tapper tapper'),
            duration: Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: 400,
        height: 400,
        child: Text('Flat Button', textAlign: TextAlign.center),
      ),
    );
  }
}
