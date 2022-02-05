import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

typedef MyOwnFunction = void Function(int score);

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final MyOwnFunction answerQuestion;
  //ValueSetter<int> answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
  //Quiz ({ Key? key }) : super(key//: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
          //questions[_questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score'] as int), (answer['text'] as String));
        }).toList()
      ],
    );
  }
}
