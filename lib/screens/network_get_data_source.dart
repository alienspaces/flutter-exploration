import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'dart:convert\';

import \'package:flutter/material.dart\';
import \'package:http/http.dart\' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(\'https://jsonplaceholder.typicode.com/albums/2\');
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

class NetworkGetDataScreen extends StatefulWidget {
  static String name = \'Network Get\';
  static String description = \'Get data from a REST API\';

  NetworkGetDataScreen({Key key}) : super(key: key);
  @override
  _NetworkGetDataScreenState createState() => _NetworkGetDataScreenState();
}

class _NetworkGetDataScreenState extends State<NetworkGetDataScreen> {
  Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get data from the network"),
      ),
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
