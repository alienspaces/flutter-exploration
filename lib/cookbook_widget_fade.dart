import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final String title;

  HomeWidget({Key key, this.title}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

Container fadingContainer = Container(
  width: 200.0,
  height: 200.0,
  color: Colors.green,
);

class _HomeWidgetState extends State<HomeWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Container'),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Row(
          children: [
            Text('Press the button to fad in and out'),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: fadingContainer,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggly Bogggly',
        child: Icon(Icons.flip),
      ),
    );
  }
}
