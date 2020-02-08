import 'package:flutter/material.dart';
import 'common.dart';
import 'package:dementia_hack/components/panel.dart';
import 'quiz.dart';


class MyApp extends StatelessWidget {
  MyApp() : super();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "TriviaMenu",
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFF5722, color)),
      home: TriviaMenu()
    );
  }
}

class TriviaMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
      ),
      body: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Easy',
                /***icon: ***/
                description: '',
                color: Colors.green,
                clickHandler:()=> moveScreen(context, () => Quiz()),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Medium',
                /***icon: ***/
                description: '',
                color: Colors.orange,
                clickHandler:()=> moveScreen(context, () => Quiz()),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Hard',
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