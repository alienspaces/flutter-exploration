import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {

  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/flutter/buttons_source.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class ButtonRippleScreen extends StatelessWidget {
  static String name = \'Buttons\';
  static String description = \'Various Button implementations within a GridView\';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(ButtonRippleScreen.name),
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
          child: ButtonsWidget(),
        ),
      ),
    );
  }
}

class ButtonContainerWidget extends StatelessWidget {
  final Widget buttonWidget;
  final String buttonDescription;

  ButtonContainerWidget({Key key, this.buttonWidget, this.buttonDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: buttonWidget,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(buttonDescription),
          ),
        ],
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _handleButtonClick() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(\'Tapper tapper\'),
          duration: Duration(milliseconds: 500),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: <Widget>[
        // Inkwell wrapped in Material
        ButtonContainerWidget(
          buttonWidget: Material(
            color: Theme.of(context).colorScheme.secondary,
            child: InkWell(
              onTap: _handleButtonClick,
              child: Container(
                padding: EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Text(
                  \'Press\',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
            ),
          ),
          buttonDescription: \'Inkwell wrapped in Material\',
        ),

        // ElevatedButton
        ButtonContainerWidget(
          buttonWidget: ElevatedButton(
            onPressed: _handleButtonClick,
            child: Container(
              padding: EdgeInsets.all(12.0),
              alignment: Alignment.center,
              child: Text(
                \'Press\',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
          buttonDescription: \'ElevatedButton\',
        ),
        // TextButton
        ButtonContainerWidget(
          buttonWidget: TextButton(
            onPressed: _handleButtonClick,
            child: Container(
              padding: EdgeInsets.all(12.0),
              alignment: Alignment.center,
              child: Text(
                \'Press\',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
          buttonDescription: \'TextButton\',
        ),
      ],
    );
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
