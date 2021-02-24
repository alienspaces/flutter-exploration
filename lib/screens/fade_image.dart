import 'package:flutter/material.dart';

class FadeImageScreen extends StatelessWidget {
  static String name = 'Fade Image';
  static String description = 'Simple FadeInImage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Image'),
      ),
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
