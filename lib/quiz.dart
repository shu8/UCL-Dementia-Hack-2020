import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Question.dart';

class QuestionBank {
  List questions = [];
  QuestionBank({this.questions});

  void addQuestion(int questionnumber, String text, String answer) {
    Question question = new Question(
        questionNumber: questionnumber,
        questionText: text,
        questionAnswer: answer);
    questions.add(question);
  }

  List getQuestions() {
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
  void showAnswer(QuestionBank bank, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Answer"),
          content: new Text(
              bank.getQuestions().elementAt(index).getQuestionAnswer()),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(context) {
    QuestionBank bank = new QuestionBank(questions: []);
    bank.addQuestion(1, 'What did you do today?', 'Reading');
    bank.addQuestion(2, 'How was your day?', 'Good');
    bank.addQuestion(3, 'What did you have for lunch?', 'Pasta');

    bank.addQuestion(4, 'Who did you speak to today?', 'Friend');
    bank.addQuestion(5, 'What did you this morning?', 'Painting');
    bank.addQuestion(6, 'What did you paint?', 'Flowers');
    return Scaffold(
        appBar: AppBar(
          title: Text('Trivia'),
          backgroundColor: Colors.deepOrange[300],
        ),
        body: ListView.builder(
            itemCount: bank.getQuestions().length,
            itemBuilder: (context, index) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Panel(
                          title: 'Question ' +
                              bank
                                  .getQuestions()
                                  .elementAt(index)
                                  .getQuestionNumber()
                                  .toString(),
                          height: 160,
                          icon: Icons.question_answer,
                          description: bank
                              .getQuestions()
                              .elementAt(index)
                              .getQuestionText(),
                          color: Colors.blue[400],
                          clickHandler: () => {},
                        )),
                    Container(
                        width: 325,
                        child: TextField(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Answer',
                          ),
                        )),
                    Center(
                        child: Panel(
                            title: 'Show answer',
                            icon: Icons.question_answer,
                            /***icon: ***/
                            description: '',
                            color: Colors.green[300],
                            clickHandler: () => showAnswer(bank, index)))
                  ]));

              // ]
            }));
  }
}
