import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'dart:ui\';
import \'package:flame/components.dart\';
import \'package:flame/extensions.dart\';
import \'package:flame/game.dart\';
import \'package:flame/geometry.dart\';
import \'package:flame/gestures.dart\';
import \'package:logging/logging.dart\';
import \'package:flutter/material.dart\' hide Image, Draggable;

// Application packages
import \'package:flutterexploration/screens/flame/collision_detection_source.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

/// Screen Boilerplate
class FlameCollisionDetectionScreen extends StatelessWidget {
  static String name = \'CollisionDetection\';
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
        title: Text(FlameCollisionDetectionScreen.name),
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
                  \'Click the screen to create whizzie things that fly and smash.\',
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

class CollidableComponent extends PositionComponent
    with HasGameRef<ExampleGame>, Hitbox, Collidable {
  Image flyImage;
  Image smashImage;
  SpriteAnimationComponent flyAnimationComponent;
  SpriteAnimationComponent smashAnimationComponent;
  SpriteAnimationComponent currentAnimation;

  Vector2 velocity;
  bool _isWallHit = false;
  bool _isCollision = false;

  CollidableComponent(Vector2 position, HitboxShape shape, this.flyImage, this.smashImage)
      : super(
          position: position,
          size: Vector2.all(100),
          anchor: Anchor.center,
        ) {
    // fly animation
    final spriteSize = Vector2.all(100.0);
    var flySpriteAnimation = SpriteAnimation.fromFrameData(
      flyImage,
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(48),
        stepTime: 0.15,
      ),
    );
    flyAnimationComponent = SpriteAnimationComponent(
      animation: flySpriteAnimation,
      size: spriteSize,
    );

    // smash animation
    var smashSpriteAnimation = SpriteAnimation.fromFrameData(
      smashImage,
      SpriteAnimationData.sequenced(
        amount: 2,
        textureSize: Vector2.all(48),
        stepTime: 0.05,
      ),
    );
    smashAnimationComponent = SpriteAnimationComponent(
      animation: smashSpriteAnimation,
      size: spriteSize,
    );

    // Add hitbox
    addShape(shape);
  }

  @override
  Future<void> onLoad() async {
    final log = Logger(\'onLoad\');
    final center = gameRef.size / 2;
    log.info(\'Center is >\$center<\');
    log.info(\'Position is >\$position<\');
    log.info(\'Center minus Position is >\${center - position}<\');

    velocity = (center - position)..scaleTo(150);
    debugColor = Colors.black;

    log.info(\'Velocity is >\$velocity<\');

    // Begin with fly animation
    currentAnimation = flyAnimationComponent;
    addChild(currentAnimation);
  }

  @override
  void update(double dt) {
    final log = Logger(\'update\');
    super.update(dt);
    if (_isWallHit) {
      remove();
      return;
    }
    if (_isCollision) {
      removeChild(currentAnimation);
      currentAnimation = smashAnimationComponent;
      addChild(currentAnimation);
    }
    log.fine(\'Velocity >\$velocity< * dt >\$dt< >\${velocity * dt}<\');
    position.add(velocity * dt);
    log.fine(\'Position >\$position<\');
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    renderShapes(canvas);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is ScreenCollidable) {
      _isWallHit = true;
      return;
    }
    _isCollision = true;
  }
}

class ExampleGame extends BaseGame with HasCollidables, TapDetector {
  Image flyImage;
  Image smashImage;
  @override
  Future<void> onLoad() async {
    add(ScreenCollidable());
    flyImage = await images.load(\'examples/collision/whizzie-fly.png\');
    smashImage = await images.load(\'examples/collision/whizzie-smash.png\');
  }

  @override
  void onTapDown(TapDownDetails details) async {
    Vector2 position = details.localPosition.toVector2();
    var shape = HitboxCircle();
    add(CollidableComponent(position, shape, flyImage, smashImage));
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
