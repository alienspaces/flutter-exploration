import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flame/components.dart\';
import \'package:flame/game.dart\';
import \'package:logging/logging.dart\';
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/flame/home_source.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

/// Screen Boilerplate
class FlameHomeScreen extends StatelessWidget {
  static String name = \'Flame Home Screen\';
  static String description = \'\';
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
              // Description
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  \'Use this screen as a template when creating new demonstration screens.\',
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

enum Direction { left, right }

class ExampleGame extends BaseGame {
  SpriteAnimationComponent animationComponent;
  Direction direction = Direction.left;
  bool turning = false;

  @override
  Future<void> onLoad() async {
    final log = Logger(\'onLoad\');
    log.info(\'Loading\');

    // Scale sprite based on screen size
    Vector2 spriteSize = Vector2.all(200);
    if (size[0] < 500) {
      spriteSize = Vector2.all(100);
    } else if (size[0] < 800) {
      spriteSize = Vector2.all(150);
    }

    log.info(\'Sprite size >\$size< spriteSize >\$spriteSize<\');

    final image = await images.load(\'examples/animation/chopper.png\');
    final jsonData = await assets.readJson(\'images/examples/animation/chopper.json\');
    final animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: (size - spriteSize) / 2,
      size: spriteSize,
    );
    animationComponent.anchor = Anchor.center;
    animationComponent.angle = 1.6;

    add(animationComponent);
  }

  @override
  void update(double dt) {
    final log = Logger(\'ExampleGame - update\');
    log.fine(\'Updating\');

    super.update(dt);

    // Hit the left side of the screen, need to turn around
    if (!turning && animationComponent.position[0] < (animationComponent.size[0] / 2)) {
      direction = Direction.right;
      turning = true;
    }
    // Hit the right side of the screen, need to turn around
    else if (!turning &&
        animationComponent.position[0] > (size[0] - (animationComponent.size[0] / 2))) {
      direction = Direction.left;
      turning = true;
    }

    // Moving right
    if (direction == Direction.right) {
      // Turning right
      if (turning) {
        if (animationComponent.angle < 4.7) {
          animationComponent.angle += 0.1;
        } else {
          animationComponent.position.add(Vector2(6, 0));
          animationComponent.angle = 4.7;
          turning = false;
        }
      }
      // Only moving
      else {
        animationComponent.position.add(Vector2(6, 0));
      }
    }
    // Moving right
    else if (direction == Direction.left) {
      // Turning left
      if (turning) {
        if (animationComponent.angle < 7.8) {
          animationComponent.angle += 0.1;
        } else {
          animationComponent.position.add(Vector2(-6, 0));
          animationComponent.angle = 1.6;
          turning = false;
        }
      }
      // Only moving
      else {
        animationComponent.position.add(Vector2(-6, 0));
      }
    }

    return;
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
