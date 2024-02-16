import 'package:first_app/result.dart';
import 'quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your fav colour?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 0},
      ],
    }, // 0
    {
      'questionText': 'What\'s your fav game?',
      'answer': [
        {'text': 'coc', 'score': 8},
        {'text': 'Pubg', 'score': 10},
        {'text': 'Fifa', 'score': 10},
      ],
    }, //1
    {
      'questionText': 'Who is your fav player?',
      'answer': [
        {'text': 'Ronaldo', 'score': 10},
        {'text': 'Messi', 'score': 9},
        {'text': 'Virat', 'score': 10},
      ],
    }, // 2
  ];
  var _totalScore = 0;

  void _resetQuiz() {
    print('object');
    setState(() {
      _totalScore = 0;
      questionIndex = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('We dont have any more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My first app"),
          ),
          body: questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: answerQuestion,
                  questionIndex: questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
