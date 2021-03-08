import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/fade_image_source.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class FadeImageScreen extends StatelessWidget {
  static String name = 'Fade Image';
  static String description = 'Simple FadeInImage';

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(FadeImageScreen.name),
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
        child: FadeInImage.assetNetwork(
          placeholder: 'images/loading.gif',
          image:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/DnD_Djinn.png/640px-DnD_Djinn.png',
        ),
      ),
    );
  }
}
