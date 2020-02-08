import 'package:dementia_hack/common.dart';
import 'package:dementia_hack/memoriesMedia.dart';
import 'package:flutter/material.dart';

class MemoriesInitialPage extends StatelessWidget {
  MemoriesInitialPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a memory'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Mood(
                        icon: Icon(Icons.mood_bad),
                        color: Colors.red,
                      ),
                      Mood(
                        icon: Icon(Icons.sentiment_dissatisfied),
                        color: Colors.orange,
                      ),
                      Mood(
                        icon: Icon(Icons.sentiment_satisfied),
                        color: Colors.yellow[600],
                      ),
                      Mood(
                        icon: Icon(Icons.mood),
                        color: Colors.green,
                      ),
                    ]),
              ),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Memory',
                    hintText: 'How are you feeling? How was your day?',
                  ),
                  onChanged: (text) => print(text)),
              FlatButton(
                  onPressed: () =>
                      {moveScreen(context, () => MemoriesMediaPage())},
                  child: Text('Next')),
            ],
          ),
        ));
  }
}

class Mood extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String label;

  Mood({this.icon, this.color, this.label}) : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: this.icon,
      color: this.color,
      iconSize: 60,
      onPressed: () {},
    );
  }
}
