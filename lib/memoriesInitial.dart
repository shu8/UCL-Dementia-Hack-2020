import 'package:dementia_hack/Database.dart';
import 'package:dementia_hack/common.dart';
import 'package:dementia_hack/memoriesMedia.dart';
import 'package:flutter/material.dart';

class MemoriesInitialPage extends StatefulWidget {
  MemoriesInitialPage() : super();

  @override
  _MemoriesInitialPageState createState() => _MemoriesInitialPageState();
}

class _MemoriesInitialPageState extends State<MemoriesInitialPage> {
  String chosenMood;
  String textEntered;

  handleNextTransition() async {
    var memoryId = await DBProvider.db.addNewMemory(
        category: 0, // a custom entry
        text: textEntered,
        timestamp: new DateTime.now().millisecondsSinceEpoch);

    moveScreen(
        context,
        () => MemoriesMediaPage(
            mood: this.chosenMood,
            textEntered: this.textEntered,
            memoryId: memoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a memory'),
          backgroundColor: Colors.purple,
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
                          label: 'bad',
                          chosenMood: chosenMood,
                          callback: () => {
                                setState(() {
                                  chosenMood = 'bad';
                                })
                              }),
                      Mood(
                          icon: Icon(Icons.sentiment_dissatisfied),
                          color: Colors.orange,
                          label: 'not great',
                          chosenMood: chosenMood,
                          callback: () => {
                                setState(() {
                                  chosenMood = 'not great';
                                })
                              }),
                      Mood(
                          icon: Icon(Icons.sentiment_satisfied),
                          color: Colors.yellow[600],
                          label: 'good',
                          chosenMood: chosenMood,
                          callback: () => {
                                setState(() {
                                  chosenMood = 'good';
                                })
                              }),
                      Mood(
                          icon: Icon(Icons.mood),
                          color: Colors.green,
                          label: 'great',
                          chosenMood: chosenMood,
                          callback: () => {
                                setState(() {
                                  chosenMood = 'great';
                                })
                              }),
                    ]),
              ),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Memory',
                    hintText: 'How are you feeling? How was your day?',
                  ),
                  onChanged: (text) => setState(() {
                        this.textEntered = text;
                      })),
              FlatButton(
                  onPressed: () async =>
                      await handleNextTransition(), // TODO send to db and also pass new memory ID
                  color: Colors.purple,
                  child: Text('Next', style: TextStyle(color: Colors.white))),
            ],
          ),
        ));
  }
}

class Mood extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String label;
  final String chosenMood;
  final Function callback;

  Mood({this.icon, this.color, this.label, this.chosenMood, this.callback})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: this.label == this.chosenMood ? this.color : Colors.transparent,
        child: IconButton(
          icon: this.icon,
          color: this.label == this.chosenMood ? Colors.white : this.color,
          iconSize: 60,
          onPressed: () => {callback()},
        ));
  }
}
