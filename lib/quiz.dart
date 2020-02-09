import 'package:flutter/material.dart';
import 'common.dart';
import 'Question.dart';

class QuestionBank {
  var list = [];
  QuestionBank({ this.list });

  void addQuestion(int questionnumber,String text,String answer)
  {
    Question question = Question(questionNumber: questionnumber,questionText:text,questionAnswer:answer);
    list.add(question);
  } 

}

class Quiz extends StatelessWidget {
  @override
  Widget build(context) {
    return 
      Scaffold(
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
    );
  }
}
