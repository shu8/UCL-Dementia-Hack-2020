import 'package:flutter/material.dart';
import 'common.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Trivia',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFF5722, color)),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Trivia'),
          ),
          body: Center(
              // child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            
            child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              Container(
                width: 415,
                height: 100,
                color: Colors.amber[600],
                child:Text(
                'Question 1',
                textScaleFactor: 5,
              ),
              ),
              Container(
                width: 415,
                height: 100,
                color: Colors.amber[600],
                child:Text(
                '\nWhat did you eat for lunch \n today?',
                textScaleFactor: 2,
                ),
              ),
            
              Container(
                width: 415,
                height: 80,
                color: Colors.amber[600],
              child:TextField(
                style: TextStyle(fontSize: 20,color: Colors.black),
                decoration: InputDecoration(
                labelText: 'Enter answer',
                ),
              )
              ),
              Container(
               child:Text('Show Answer', style: TextStyle(fontSize: 20),) 
              )
            ]
            )
          // ]
          )
          
          )
          
    );
  }
}
