import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/survey_bloc.dart';
import '../widgets/next_button.dart';
import '../widgets/standard_question.dart';
import '../widgets/top_bar.dart';

class QuestionPage extends StatefulWidget {
  final QuestionState questionState;

  QuestionPage({
    Key key,
    @required this.questionState,
  }) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth = 50;
  final double buttonHeight = 70;
  final double chevronSize = 40;

  set _answerSelected(int value) {
    widget.questionState.surveyElement.answer.answerIndex = value;
  }

  int get _answerSelected =>
      widget.questionState.surveyElement.answer.answerIndex;

  _QuestionPageState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingWidth),
      child: Column(
        children: <Widget>[
          TopBar(
            currentQuestion: widget.questionState.questionIndex + 1,
            numberQuestions: widget.questionState.numberTotalQuestions,
            onBackButtonTap: () {},
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(paddingWidth),
              child: Column(
                children: <Widget>[
                  StandardQuestion(
                    questionText:
                        widget.questionState.surveyElement.question.text,
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
                      if (_isLastQuestion()) {
                        BlocProvider.of<SurveyBloc>(context)
                            .add(SubmitAnswersEvent());
                      } else {
                        BlocProvider.of<SurveyBloc>(context)
                            .add(NextQuestionEvent());
                      }
                    },
                    text: _isLastQuestion() ? 'Absenden' : 'Weiter',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isLastQuestion() {
    return (widget.questionState.questionIndex + 1 ==
        widget.questionState.numberTotalQuestions);
  }
}
