import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;//pointer to the _answerQuestion function in main.dart
  final String answerText;
  Answer(this.selectHandler,this.answerText );//pointer as an argument in the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:  ElevatedButton(
        onPressed: selectHandler,//with (), the constructor is executed as the program runs, but we want it onPressed
        child: Text(answerText),
      ),
    );
  }
}
