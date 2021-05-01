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

  @override
  Future<void> onLoad() async {
    final log = Logger('onLoad');

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

    log.info('Animation position >${animationComponent.position}');
    log.info('Animation angle >${animationComponent.angle}');

    add(animationComponent);
  }

  @override
  void update(double dt) {
    final log = Logger('update');

    super.update(dt);

    if (animationComponent.position[0] < 100) {
      direction = Direction.right;
      animationComponent.angle = 4.7;
    }
    if (animationComponent.position[0] > (size[0] - 100)) {
      direction = Direction.left;
      animationComponent.angle = 1.6;
    }

    if (direction == Direction.right) {
      animationComponent.position.add(Vector2(6, 0));
    }
    if (direction == Direction.left) {
      animationComponent.position.add(Vector2(-6, 0));
    }
  }
}
