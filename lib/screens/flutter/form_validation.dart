import 'package:flutter/material.dart';

// Application packages
import 'package:flutterexploration/screens/flutter/form_validation_source.dart';
import 'package:flutterexploration/widgets/screen_body.dart';
import 'package:flutterexploration/widgets/screen_list_drawer.dart';
import 'package:flutterexploration/widgets/open_source_drawer.dart';
import 'package:flutterexploration/widgets/source_drawer.dart';

class FormValidationScreen extends StatelessWidget {
  static String name = 'Form Validation';
  static String description = 'Validate a form with a TextEditingController';
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
    print("Field value: ${fieldController.text}");
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
              labelText: 'This is label text',
              hintText: 'This is hint text',
              filled: true,
              fillColor: Colors.brown[300],
              focusColor: Colors.brown[100], // dunno..
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter something.. anything!';
              }
              return null; // all good
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Beep brrrzzt beep'),
                  ),
                );
                return;
              }
              // Focus on field when form is not valid
              fieldFocusNode.requestFocus();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
