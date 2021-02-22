import 'package:flutter/material.dart';

class ButtonRippleScreen extends StatelessWidget {
  static String name = 'Button Ripple';
  static String description = 'Utilise an InkWell for ripple effects';

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
        ScaffoldMessenger.of(context).showSnackBar(
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
