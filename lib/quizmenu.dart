import 'package:flutter/material.dart';
import 'common.dart';
import 'package:dementia_hack/components/panel.dart';
import 'quiz.dart';

class TriviaMenu extends StatelessWidget{
  TriviaMenu() : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Trivia Menu"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Easy',
                height: 160,
                /***icon: ***/
                description: '',
                color: Colors.green,
                clickHandler:()=> moveScreen(context, () => Quiz()),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Medium',
                height: 160,
                /***icon: ***/
                description: '',
                color: Colors.orange,
                clickHandler:()=> moveScreen(context, () => Quiz()),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Hard',
                height: 160,
                /***icon: ***/
                description: '',
                color: Colors.red[200],
                clickHandler:()=> moveScreen(context, () => Quiz()),
              )),
        ],
      ),
    );
  }
}