class Question{
final int questionNumber;
final String questionText;
final String questionAnswer;

Question({this.questionNumber,this.questionText,this.questionAnswer});

int getQuestionNumber()
{
  return questionNumber;
}

String getQuestionText()
{
  return questionText;
}

String getQuestionAnswer()
{
  return questionAnswer;
}

}