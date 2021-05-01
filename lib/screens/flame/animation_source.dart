import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'dart:ui\';
import \'package:flame/components.dart\';
import \'package:flame/game.dart\';
import \'package:flame/gestures.dart\';
import \'package:flutter/gestures.dart\';
import \'package:flutter/material.dart\' hide Image;

// Application packages
import \'package:flutterexploration/screens/flame/animation_source.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

/// Screen Boilerplate
class FlameAnimationScreen extends StatelessWidget {
  static String name = \'Animation\';
  static String description = \'\';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Example game
  final game = ExampleGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(FlameAnimationScreen.name),
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
              // Description
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  \'Click the screen to create a swimming fish catcher.\',
                  textAlign: TextAlign.center,
                ),
              ),
              // Game
              Expanded(
                // A StatefulWidget that is in charge of attaching a Game
                // instance into the flutter tree
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

/// Example game
class ExampleGame extends BaseGame with TapDetector {
  Image chopper;
  Image creature;
  SpriteAnimation animation;

  @override
  Future<void> onLoad() async {
    chopper = await images.load(\'examples/animation/chopper.png\');
    creature = await images.load(\'examples/animation/creature.png\');

    animation = SpriteAnimation.fromFrameData(
      chopper,
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(48),
        stepTime: 0.15,
      ),
    );

    final spriteSize = Vector2.all(100.0);
    final animationComponent2 = SpriteAnimationComponent(
      animation: animation,
      size: spriteSize,
    );
    animationComponent2.x = size.x / 2 - spriteSize.x;
    animationComponent2.y = spriteSize.y;

    final reversedAnimationComponent = SpriteAnimationComponent(
      animation: animation.reversed(),
      size: spriteSize,
    );
    reversedAnimationComponent.x = size.x / 2;
    reversedAnimationComponent.y = spriteSize.y;

    add(animationComponent2);
    add(reversedAnimationComponent);
  }

  void addAnimation(Vector2 position) {
    final size = Vector2(291, 178);

    final animationComponent = SpriteAnimationComponent.fromFrameData(
      creature,
      SpriteAnimationData.sequenced(
        amount: 18,
        amountPerRow: 10,
        textureSize: size,
        stepTime: 0.15,
        loop: false,
      ),
      size: size,
      removeOnFinish: true,
    );

    animationComponent.position = position;
    animationComponent.position = animationComponent.position - size / 2;
    add(animationComponent);
  }

  @override
  void onTapDown(TapDownDetails evt) {
    addAnimation(Vector2(evt.globalPosition.dx, evt.globalPosition.dy));
  }
}

  ''';

  @override
  Widget build(BuildContext context) {

    // Adjust font size based on screen width
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontSize = 20;
    if (width < 1024) {
      fontSize = 14;
    } else if (width < 2048) {
      fontSize = 18;
    }

    return Container(
      alignment: Alignment.topLeft,
      color: Theme.of(context).colorScheme.background,
      child: Container(
        // Setting minimum height allows scrolling when
        // content height is greater than the screen height
        constraints: BoxConstraints(
          minHeight: height,
        ),
        color: Theme.of(context).colorScheme.secondary,
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: HighlightView(
          "$textContent",
          language: 'dart',
          theme: githubTheme,
          padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
