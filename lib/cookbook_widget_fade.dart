import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Container fadingContainer = Container(
  width: 200.0,
  height: 200.0,
  color: Colors.green,
);

class _HomeScreenState extends State<HomeScreen> {
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
