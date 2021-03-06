import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'dart:async\';
import \'dart:io\';

import \'package:flutter/foundation.dart\';
import \'package:flutter/material.dart\';
import \'package:path_provider/path_provider.dart\';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File(\'\$path/counter.txt\');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString(\'\$counter\');
  }
}

class FileIOScreen extends StatefulWidget {
  static String name = \'File IO\';
  static String description = \'Read and write values from local storage\';

  final CounterStorage storage = CounterStorage();

  FileIOScreen({Key key}) : super(key: key);

  @override
  _FileIOScreenState createState() => _FileIOScreenState();
}

class _FileIOScreenState extends State<FileIOScreen> {
  int _counter;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(\'Reading and writing files\'),
        ),
        body: Center(
          child: Text(
            \'Button tapped \$_counter time\${_counter == 1 ? \'\' : \'s\'}.\',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: \'Increment\',
          child: Icon(Icons.add),
        ));
  }
}

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        padding: EdgeInsets.all(12),
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
