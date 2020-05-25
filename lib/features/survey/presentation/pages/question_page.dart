import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/response_option.dart';
import '../bloc/survey_bloc.dart';
import '../fixed_values/survey_sizes.dart';
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
  var submitButtonText = 'Absenden';
  var nextButtonText = 'Weiter';

  ResponseOption response;

  int get _answerSelected => (response == null) ? null : response.value;

  set _answerSelected(int value) => {response = ResponseOption(value)};

  _QuestionPageState(this.response);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: SurveySizes.paddingSize),
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
              margin: EdgeInsets.all(SurveySizes.paddingSize),
              child: Column(
                children: <Widget>[
                  StandardQuestion(
                    questionText:
                        widget.questionState.surveyElement.questionText,
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
