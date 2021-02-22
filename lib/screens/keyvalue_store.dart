import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStoreScreen extends StatefulWidget {
  static String name = 'KeyValue Store';
  static String description = 'Read and write values using SharedPreferences';

  KeyValueStoreScreen({Key key}) : super(key: key);
  final String title = 'Key/Value Demo';

  @override
  _KeyValueStoreScreenState createState() => _KeyValueStoreScreenState();
}

class _KeyValueStoreScreenState extends State<KeyValueStoreScreen> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
