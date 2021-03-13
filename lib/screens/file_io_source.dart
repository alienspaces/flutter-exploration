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

// Application packages
import \'package:flutterexploration/screens/file_io_source.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class FileIOScreen extends StatefulWidget {
  static String name = \'File IO\';
  static String description = \'Read and write values from local storage\';
  static bool hide = false;

  final CounterStorage storage = CounterStorage();

  FileIOScreen({Key key}) : super(key: key);

  @override
  _FileIOScreenState createState() => _FileIOScreenState();
}

class _FileIOScreenState extends State<FileIOScreen> {
  int _counter;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
        // Common application bar
        appBar: AppBar(
          title: Text(FileIOScreen.name),
          actions: <Widget>[
            // Open source code
            OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
          ],
        ),
        // Screen list drawer
        drawer: ScreenListDrawerWidget(),
        // Source Code drawer
        endDrawer: SourceDrawerWidget(
          scaffoldKey: _scaffoldKey,
          sourceWidget: SourceWidget(),
        ),
        // Example
        body: ScreenBodyWidget(
          child: Center(
            child: Text(
              \'Button tapped \$_counter time\${_counter == 1 ? \'\' : \'s\'}.\',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: \'Increment\',
          child: Icon(Icons.add),
        ));
  }
}

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

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Theme.of(context).colorScheme.background,
      child: Expanded(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: HighlightView(
            "$textContent",
            language: 'dart',
            theme: githubTheme,
            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
