import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:logging/logging.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flame/home_source.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

/// Screen Boilerplate
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
              // Description
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  'Use this screen as a template when creating new demonstration screens.',
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
    final log = Logger('onLoad');
    log.info('Loading');

    final image = await images.load('examples/animation/chopper.png');
    final jsonData = await assets.readJson('images/examples/animation/chopper.json');
    final animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    final spriteSize = Vector2.all(200);
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
    final log = Logger('ExampleGame - update');
    log.fine('Updating');

    super.update(dt);

    // Hit the left side of the screen, need to turn around
    if (!turning && animationComponent.position[0] < 100) {
      direction = Direction.right;
      turning = true;
    }
    // Hit the right side of the screen, need to turn around
    else if (!turning && animationComponent.position[0] > (size[0] - 100)) {
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
