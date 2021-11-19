import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var apple = ['Apple'];
  var orange = ['Orange'];
  var rambutan = ['Rambutan'];
  var _message = '';

  final numCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter List'),
        ),
        body: Column(children: [
          Text('The list of fruits:'),
          Text('1) ' + apple[0]),
          Text('2) ' + orange[0]),
          Text('3) ' + rambutan[0]),
          TextField(
              controller: numCon,
              decoration: InputDecoration(
                hintText: "Enter fruit number",
              )),
          RaisedButton(
            onPressed: () {
              setState(() {
                FunctionMessage();
              });
            },
            child: Text('Submit'),
          ),
          Text('You fruit is ' + _message),
        ]),
      ),
    );
  }

  void FunctionMessage() {
    int value = int.parse(numCon.text);
    var fruitName;
    if (value == 1) {
      fruitName = 'Apple';
    } else if (value == 2) {
      fruitName = 'Orange';
    } else {
      fruitName = 'Rambutan';
    }

    setState(() => _message = fruitName);
  }
}
