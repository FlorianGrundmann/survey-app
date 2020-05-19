import 'package:flutter/material.dart';

import '../widgets/next_button.dart';
import '../widgets/standard_question.dart';
import '../widgets/top_bar.dart';

class QuestionPage extends StatefulWidget {
  final String question;
  final Function(int) onNext;
  final int currentQuestion;
  final int numberQuestions;

  QuestionPage({
    Key key,
    @required this.question,
    @required this.onNext,
    @required this.currentQuestion,
    @required this.numberQuestions,
  }) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth = 50;
  final double buttonHeight = 70;
  final double chevronSize = 40;

  int _answerSelected;

  _QuestionPageState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingWidth),
      child: Column(
        children: <Widget>[
          TopBar(
            currentQuestion: widget.currentQuestion,
            numberQuestions: widget.numberQuestions,
            onBackButtonTap: () {},
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(paddingWidth),
              child: Column(
                children: <Widget>[
                  StandardQuestion(
                    questionText: widget.question,
                    answerSelectedValue: _answerSelected,
                    onAnswerSelected: (value) {
                      setState(() {
                        _answerSelected = value;
                      });
                    },
                  ),
                  NextButton(
                    activated: (_answerSelected != null),
                    onPressed: () {
                      int answer = _answerSelected;
                      _answerSelected = null;
                      widget.onNext(answer);
                    },
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
