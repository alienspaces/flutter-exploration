import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flame/components.dart\';
import \'package:flame/game.dart\';
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/flame/composability_source.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

///
class FlameComposabilityScreen extends StatelessWidget {
  static String name = \'Composability Screen\';
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
        title: Text(FlameComposabilityScreen.name),
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

class Square extends PositionComponent {
  Square(Vector2 position, Vector2 size, {double angle = 0}) {
    this.position.setFrom(position);
    this.size.setFrom(size);
    this.angle = angle;
  }
}

class ParentSquare extends Square {
  ParentSquare(Vector2 position, Vector2 size) : super(position, size);

  @override
  void onMount() {
    super.onMount();
    createChildren();
  }

  void createChildren() {
    // All positions here are in relation to the parent\'s position
    final children = [
      Square(Vector2(100, 100), Vector2(50, 50), angle: 2),
      Square(Vector2(160, 100), Vector2(50, 50), angle: 3),
      Square(Vector2(170, 150), Vector2(50, 50), angle: 4),
      Square(Vector2(70, 200), Vector2(50, 50), angle: 5),
    ];

    children.forEach(addChild);
  }
}

class ExampleGame extends BaseGame {
  ParentSquare _parent;

  @override
  bool debugMode = true;

  @override
  Future<void> onLoad() async {
    _parent = ParentSquare(Vector2.all(300), Vector2.all(300))..anchor = Anchor.center;
    add(_parent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _parent.angle += dt;
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
