import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(title: Text('Validate a form')),
      body: FormWidget(),
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
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
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
