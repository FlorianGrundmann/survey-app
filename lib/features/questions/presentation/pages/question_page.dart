import 'package:flutter/material.dart';

import '../widgets/next_button.dart';
import '../widgets/standard_question.dart';
import '../widgets/top_bar.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth = 50;
  final double buttonHeight = 70;
  final double chevronSize = 40;

  final int currentQuestion = 2;
  final int numberQuestions = 10;

  int _answerSelected;

  _QuestionPageState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.only(top: paddingWidth),
      child: Column(
        children: <Widget>[
          TopBar(
            currentQuestion: currentQuestion,
            numberQuestions: numberQuestions,
            onBackButtonTap: () {},
          ),
          Expanded(
            child: Container(
              //color: Colors.green,
              margin: EdgeInsets.all(paddingWidth),
              child: Column(
                children: <Widget>[
                  StandardQuestion(
                    questionText:
                        'Der Ablauf der Anästhesie sollte besser erläutert werden.',
                    answerSelectedValue: _answerSelected,
                    onAnswerSelected: (value) {
                      setState(() {
                        _answerSelected = value;
                      });
                    },
                  ),
                  NextButton(
                    activated: (_answerSelected != null),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
