import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/loader.dart';

void main() {
  runApp(MyApp());
}
//class Person{
// String name;
//int age;
//Person({this.name = 'Max', this.age=30});
//}
// in main function
// var p1 = Person(name: 'Max', age: 30);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); //connected the 2 classes Myapp and MyAppState
  }
} //private class conversion syntax "_MyAppState" leading underscore

class _MyAppState extends State<MyApp> {
  static const _questions = [
    // or can do final questions = const[]
    {
      //Map is a collection of key-value combo
      //Map is a separate class in dart, here shorthand used for map "{...}"
      'questionText': 'What\'s my favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 6},
        {'text': 'White', 'score': 8}
      ],
    }, //Map
    {
      'questionText': 'What\'s  my favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 8},
        {'text': 'Dog', 'score': 10},
        {'text': 'Fish', 'score': 4},
        {'text': 'Rabbit', 'score': 7}
      ],
    }, //Map
    {
      'questionText': 'What\'s  my favourite dish?',
      'answers': [
        {'text': 'North Indian', 'score': 10},
        {'text': 'South Indian', 'score': 8},
        {'text': 'Continental', 'score': 6},
        {'text': 'Chinese', 'score': 7}
      ],
    }, //Map
  ];
//null -> can be assigned to reset the value of a variable
// default initialisation state is null
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more question!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Who Am I?'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
      theme: ThemeData.dark(),
    );
  }
}
