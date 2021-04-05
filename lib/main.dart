import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  _navigateTonext() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListFruits()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                    _navigateTonext();
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListFruits extends StatefulWidget {
  ListFruits({Key key}) : super(key: key);

  @override
  _ListFruitsState createState() => _ListFruitsState();
}

class _ListFruitsState extends State<ListFruits> {
  List<String> litems = [
    "apples",
    "oranges",
    "mango",
    "apples",
    "oranges",
    "mango",
    "apples",
    "oranges",
    "mango",
    "apples",
    "oranges",
    "mango"
  ];

  Widget buildBody(BuildContext ctxt, int index) {
    return ListTile(
      title: Text(
        litems[index],
      ),
      leading: Icon(
        Icons.breakfast_dining,
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of fruits'),
      ),
      body: ListView.builder(
          itemCount: litems.length,
          itemBuilder: (BuildContext ctxt, int index) =>
              buildBody(ctxt, index)),
    );
  }
}
