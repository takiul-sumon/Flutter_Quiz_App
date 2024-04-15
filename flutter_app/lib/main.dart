//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'Text': 'Black', 'score': 10},
        {'Text': 'Red', 'score': 6},
        {'Text': 'Green', 'score': 4},
        {'Text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'Text': 'Rabbit', 'score': 10},
        {'Text': 'Snake', 'score': 6},
        {'Text': 'Elephant', 'score': 9},
        {'Text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': '121 Divided by 11 is ',
      'answers': [
        {'Text': '10', 'score': 10},
        {'Text': '11', 'score': 0},
        {'Text': '19', 'score': 0},
        {'Text': '18', 'score': 0}
      ],
    },
    {
      'questionText': 'What is 6% Equals to ',
      'answers': [
        {'Text': '0.006', 'score': 0},
        {'Text': '0.6', 'score': 0},
        {'Text': '0.06', 'score': 10},
        {'Text': '0.0006', 'score': 0}
      ],
    },
    {
      'questionText': '  Solve 23 + 3 ÷ 3',
      'answers': [
        {'Text': '24', 'score': 10},
        {'Text': '25', 'score': 0},
        {'Text': '26', 'score': 0},
        {'Text': '27', 'score': 0}
      ],
    },
    {
      'questionText': 'Solve 3 + 6 × ( 5 + 4) ÷ 3 - 7',
      'answers': [
        {'Text': '11', 'score': 0},
        {'Text': '16', 'score': 0},
        {'Text': '14', 'score': 10},
        {'Text': '15', 'score': 0}
      ],
    },
    {
      'questionText': 'Add the Decimals 5.23 + 8.79',
      'answers': [
        {'Text': '14.02', 'score': 10},
        {'Text': '14.19', 'score': 0},
        {'Text': '14.11', 'score': 0},
        {'Text': '14.29', 'score': 0}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetquiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalscore = _totalscore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.home,
            color: Colors.white,
          ),
          backgroundColor: Colors.blueAccent,
          title: Text(
            'My First App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalscore, _resetquiz),
        ),
      ),
    );
  }
}
