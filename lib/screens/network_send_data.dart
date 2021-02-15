import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    'https://jsonplaceholder.typicode.com/albums',
    headers: <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  }
  throw Exception('Failed to load album');
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class NetworkSendDataScreen extends StatefulWidget {
  NetworkSendDataScreen({Key key}) : super(key: key);
  @override
  _NetworkSendDataScreenState createState() {
    return _NetworkSendDataScreenState();
  }
}

class _NetworkSendDataScreenState extends State<NetworkSendDataScreen> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Data Example'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter Title'),
                  ),
                  RaisedButton(
                    child: Text('Create Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = createAlbum(_controller.text);
                      });
                    },
                  ),
                ],
              )
            : FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}