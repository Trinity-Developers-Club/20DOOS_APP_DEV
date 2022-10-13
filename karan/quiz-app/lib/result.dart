import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  //adding getter
  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = 'You Scored $resultScore';
    } else if (resultScore <= 12) {
      resultText = 'You Scored $resultScore';
    } else if (resultScore <= 16) {
      resultText = 'You Scored $resultScore';
    } else {
      resultText = 'You Scored $resultScore';
    }
    return resultText;
  }

  Result(this.resultScore, this.resetHandler);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz'))
        ],
      ),
    );
  }
}
