import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// Application packages
import 'package:flutterexploration/screens/flutter/network_send_data_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class NetworkSendDataScreen extends StatefulWidget {
  static String name = 'Network Send';
  static String description = 'Send data to a REST API';
  static bool hide = false;

  NetworkSendDataScreen({Key key}) : super(key: key);
  @override
  _NetworkSendDataScreenState createState() {
    return _NetworkSendDataScreenState();
  }
}

class _NetworkSendDataScreenState extends State<NetworkSendDataScreen> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(NetworkSendDataScreen.name),
        actions: <Widget>[
          // Open source code
          OpenSourceDrawerWidget(scaffoldKey: _scaffoldKey),
        ],
      ),
      // Common screen list drawer
      drawer: ScreenListDrawerWidget(),
      // Common source code drawer
      endDrawer: SourceDrawerWidget(
        scaffoldKey: _scaffoldKey,
        sourceWidget: SourceWidget(),
      ),
      // Common screen body containing example
      body: ScreenBodyWidget(
        child: Container(
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
                    ElevatedButton(
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
      ),
    );
  }
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

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    Uri(host: 'https://jsonplaceholder.typicode.com/albums'),
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
