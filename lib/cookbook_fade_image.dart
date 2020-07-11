import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
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
              'https://www.blackgate.com/wp-content/uploads/2014/02/basic-dnd.jpg',
        ),
      ),
    );
  }
}
