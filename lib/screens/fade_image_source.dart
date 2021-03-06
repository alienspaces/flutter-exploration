import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

class FadeImageScreen extends StatelessWidget {
  static String name = \'Fade Image\';
  static String description = \'Simple FadeInImage\';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(\'Fading Image\'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: \'images/loading.gif\',
          image:
              \'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/DnD_Djinn.png/640px-DnD_Djinn.png\',
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
