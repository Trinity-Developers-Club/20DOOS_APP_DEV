import 'package:flutter/material.dart ';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() //executes a function on every element of the list
      ], // ... take a list, pull all values out of list, add them to surrounding list as individual values
      //adding values to the lists of list
    );
  }
}
