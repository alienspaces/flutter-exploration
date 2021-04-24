import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart' hide Image, Draggable;

// Application packages
import 'package:flutterexploration/screens/flame/collision_detection_source.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

///
class FlameCollisionDetectionScreen extends StatelessWidget {
  static String name = 'CollisionDetection';
  static String description = '';
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
          child: GameWidget(
            game: ExampleGame(),
          ),
        ),
      ),
    );
  }
}

class MyCollidable extends PositionComponent with HasGameRef<ExampleGame>, Hitbox, Collidable {
  Vector2 velocity;
  final _collisionColor = Colors.amber;
  final _defaultColor = Colors.cyan;
  bool _isWallHit = false;
  bool _isCollision = false;

  MyCollidable(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(100),
          anchor: Anchor.center,
        ) {
    addShape(HitboxCircle());
  }

  @override
  Future<void> onLoad() async {
    final center = gameRef.size / 2;
    velocity = (center - position)..scaleTo(150);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_isWallHit) {
      remove();
      return;
    }
    debugColor = _isCollision ? _collisionColor : _defaultColor;
    position.add(velocity * dt);
    _isCollision = false;
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
  @override
  Future<void> onLoad() async {
    add(ScreenCollidable());
  }

  @override
  void onTapDown(TapDownDetails details) {
    add(MyCollidable(details.localPosition.toVector2()));
  }
}
