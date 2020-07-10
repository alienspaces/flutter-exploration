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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
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
