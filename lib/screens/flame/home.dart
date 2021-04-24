import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flame/home_source.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

///
class FlameHomeScreen extends StatelessWidget {
  static String name = 'Flame Home Screen';
  static String description = '';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(FlameHomeScreen.name),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  'Use this screen as a template when creating new demonstration screens.',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                /// A StatefulWidget that is in charge of attaching a Game
                /// instance into the flutter tree
                child: GameWidget(
                  game: ExampleGame(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    final image = await images.load('examples/animation/chopper.png');
    final jsonData = await assets.readJson('images/examples/animation/chopper.json');
    final animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    final spriteSize = Vector2.all(200);
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: (size - spriteSize) / 2,
      size: spriteSize,
    );
    add(animationComponent);
  }
}
