import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'common.dart';
import 'Question.dart';

class QuestionBank {
  List questions = [];
  QuestionBank({ this.questions });

  void addQuestion(int questionnumber,String text,String answer)
  {
    Question question = new Question(questionNumber: questionnumber,questionText:text,questionAnswer:answer);
    questions.add(question);
  } 
  List getQuestions()
  {
    return questions;
  }

}

// class Quiz extends StatelessWidget{
//   @override
//   Widget build()
// }

class Quiz extends StatefulWidget {
  Quiz() : super();

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override

  Widget build(context) {
    QuestionBank bank = new QuestionBank(questions:[]);
    bank.addQuestion(1,'What did you do today?', 'Reading');
    bank.addQuestion(2, 'How was your day?', 'Good');
    bank.addQuestion(3, 'What did you have for lunch?', 'Pasta');
    return 
      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text('Trivia'),
          ),
          body: 
          ListView.builder(
            itemCount: bank.getQuestions().length,
            itemBuilder: (context,index){

            return Center(
            child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              Container(
                width: 415,
                height: 100,
                color: Colors.amber[600],
                child:Text(
                'Question '+ bank.getQuestions().elementAt(index).getQuestionNumber().toString(),
                textScaleFactor: 5,
              ),
              ),
              Container(
                width: 415,
                height: 100,
                color: Colors.amber[600],
                child:Text(
                bank.getQuestions().elementAt(index).getQuestionText(),
                // 'test',
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
              Center(
                child:Panel(
                title: 'Show answer',
                /***icon: ***/
                description: '',
                color: Colors.orange,
                clickHandler: ()=> setState((){title: 'Swda';}),
                )
              )
            ]
            )
          // ]
          );   
            }
      ) 
    );
  }
}
