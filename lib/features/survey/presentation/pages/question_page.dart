import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_app/features/survey/domain/entities/survey_element.dart';

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
  _QuestionPageState createState() =>
      _QuestionPageState(questionState.response);
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth = 50;
  final double buttonHeight = 70;
  final double chevronSize = 40;

  var submitButtonText = 'Absenden';
  var nextButtonText = 'Weiter';

  ResponseOption response;

  int get _answerSelected => (response == null) ? null : response.answerIndex;

  set _answerSelected(int value) => {response = ResponseOption(value)};

  _QuestionPageState(this.response);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingWidth),
      child: Column(
        children: <Widget>[
          TopBar(
            currentQuestion: widget.questionState.questionIndex + 1,
            numberQuestions: widget.questionState.numberTotalQuestions,
            onBackButtonTap: () {
              if (!_isFirstQuestion()) {
                BlocProvider.of<SurveyBloc>(context)
                    .add(PreviousQuestionEvent());
              } else {
                BlocProvider.of<SurveyBloc>(context).add(RestartEvent());
              }
            },
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
                            .add(NextQuestionEvent(response));
                      }
                    },
                    text: _isLastQuestion() ? submitButtonText : nextButtonText,
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

  bool _isFirstQuestion() {
    return (widget.questionState.questionIndex == 0);
  }
}
