import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
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
  // form state key
  final _formKey = GlobalKey<FormState>();
  // field controller
  final fieldController = TextEditingController();

  _printLatestValue() {
    // The following will output to the debug console
    print("Field value: ${fieldController.text}");
  }

  @override
  void initState() {
    super.initState();
    fieldController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    fieldController.dispose();
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
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Beep brrrzzt beep')));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
