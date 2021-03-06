import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'dart:async\';
import \'dart:convert\';

import \'package:flutter/foundation.dart\';
import \'package:flutter/material.dart\';
import \'package:http/http.dart\' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(\'https://jsonplaceholder.typicode.com/photos\');

  // Compute function runs in a separate isolate
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json[\'albumId\'] as int,
      id: json[\'id\'] as int,
      title: json[\'title\'] as String,
      url: json[\'url\'] as String,
      thumbnailUrl: json[\'thumbnailUrl\'] as String,
    );
  }
}

class NetworkGetLargeDataScreen extends StatelessWidget {
  static String name = \'Network Get Lots\';
  static String description = \'Get lots of data from a REST API\';

  final String title = \'Fetch lots of data\';

  NetworkGetLargeDataScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(photos[index].title),
            Image.network(photos[index].thumbnailUrl),
          ],
        );
      },
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
