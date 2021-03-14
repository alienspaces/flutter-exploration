import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceWidget extends StatelessWidget {
  final String textContent = '''
  
import \'package:flutter/material.dart\';

// Application packages
import \'package:flutterexploration/screens/form_validation_source.dart\';
import \'package:flutterexploration/widgets/screen_body.dart\';
import \'package:flutterexploration/widgets/screen_list_drawer.dart\';
import \'package:flutterexploration/widgets/open_source_drawer.dart\';
import \'package:flutterexploration/widgets/source_drawer.dart\';

class FormValidationScreen extends StatelessWidget {
  static String name = \'Form Validation\';
  static String description = \'Validate a form with a TextEditingController\';
  static bool hide = false;

  // Key for source drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      key: _scaffoldKey,
      // Common application bar
      appBar: AppBar(
        title: Text(FormValidationScreen.name),
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
        child: FormWidget(),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  FormWidgetState createState() {
    return FormWidgetState();
  }
}

class FormWidgetState extends State<FormWidget> {
  // Form state key
  final _formKey = GlobalKey<FormState>();
  // Form field controller
  final fieldController = TextEditingController();
  // Form field focus node
  final fieldFocusNode = FocusNode();

  _printLatestValue() {
    // The following will output the field value to the debug console
    print("Field value: \${fieldController.text}");
  }

  @override
  void initState() {
    super.initState();
    fieldController.addListener(_printLatestValue);
  }

  // NOTE: Important to also dispose of any form field controllers
  @override
  void dispose() {
    fieldController.dispose();
    fieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: fieldController,
            focusNode: fieldFocusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: \'This is label text\',
              hintText: \'This is hint text\',
              filled: true,
              fillColor: Colors.brown[300],
              focusColor: Colors.brown[100], // dunno..
            ),
            validator: (value) {
              if (value.isEmpty) {
                return \'Please enter something.. anything!\';
              }
              return null; // all good
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(\'Beep brrrzzt beep\'),
                  ),
                );
                return;
              }
              // Focus on field when form is not valid
              fieldFocusNode.requestFocus();
            },
            child: Text(\'Submit\'),
          ),
        ],
      ),
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
