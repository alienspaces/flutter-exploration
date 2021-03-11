import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'dart:convert\';

import \'package:flutter/material.dart\';
import \'package:http/http.dart\' as http;

// Application packages
import \'package:flutterexploration/screens/network_get_data_source.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class NetworkGetDataScreen extends StatefulWidget {
  static String name = \'Network Get\';
  static String description = \'Get data from a REST API\';

  NetworkGetDataScreen({Key key}) : super(key: key);
  @override
  _NetworkGetDataScreenState createState() => _NetworkGetDataScreenState();
}

class _NetworkGetDataScreenState extends State<NetworkGetDataScreen> {
  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(NetworkGetDataScreen.name),
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
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("\${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri(host: \'https://jsonplaceholder.typicode.com/albums/2\'));
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception(\'Failed to load album\');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json[\'userId\'],
      id: json[\'id\'],
      title: json[\'title\'],
    );
  }
}

  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: HighlightView(
        "$textContent", 
        language: 'dart',
        theme: githubTheme,
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
