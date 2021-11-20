import 'package:flutter/material.dart';

class Fruit {
  final String title;
  final String imageURL;

  Fruit({required this.title, required this.imageURL});
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final fruits = [
    Fruit(
        title: "Apple",
        imageURL:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Ffood%2Fapple&psig=AOvVaw1a3t7gNsWJCZYk1tv4i4mm&ust=1637476242300000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjnt8CopvQCFQAAAAAdAAAAABAD"),
    Fruit(
        title: "Orange",
        imageURL:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Foranges&psig=AOvVaw1Kt4GYIwaipbmskYX7vK0i&ust=1637476374029000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOjBqP-opvQCFQAAAAAdAAAAABAD"),
    Fruit(
        title: "Rambutan",
        imageURL:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fsolidstarts.com%2Ffoods%2Frambutan%2F&psig=AOvVaw1M9QuypoQuyT3BcJLYSPPU&ust=1637476547440000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLDovtKppvQCFQAAAAAdAAAAABAD")
  ];

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
        Expanded(
          child: ListView.builder(
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                final fruit = fruits[index];

                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    leading: Image(
                      image: NetworkImage(fruit.imageURL),
                    ),
                    title: Text(fruit.title),
                  ),
                );
              }),
        ),
        TextField(
            controller: numCon,
            decoration: InputDecoration(
              hintText: "Enter fruit number",
            )),
        Container(
          padding: EdgeInsets.all(150),
          child: buildInsertButton(),
        ),
        Text('You fruit is ' + _message),
      ]),
    ));
  }

  Widget buildInsertButton() => RaisedButton(
        onPressed: () {
          setState(() {
            FunctionMessage();
          });
        },
        child: Text('Submit'),
      );

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
