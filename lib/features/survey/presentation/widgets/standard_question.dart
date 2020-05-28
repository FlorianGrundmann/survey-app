import 'package:flutter/material.dart';
import 'package:survey_app/features/survey/domain/entities/response_option.dart';
import 'package:survey_app/features/survey/presentation/fixed_values/survey_sizes.dart';

import 'four_scale_button_group.dart';
import '../../domain/entities/question.dart';

class StandardQuestion extends StatelessWidget {
  final double paddingWidth = 50;

  final Question question;
  final Function(ResponseOption) onAnswerSelected;
  final answerSelectedValue;

  const StandardQuestion({
    Key key,
    @required this.question,
    @required this.onAnswerSelected,
    @required this.answerSelectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildQuestionText(context),
          ),
          Expanded(
            flex: 2,
            child: _buildQuestionButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionText(BuildContext context) {
    return Center(
      child: Text(
        question.questionText,
        style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: SurveySizes.scaledHeight(
                  SurveySizes.questionFontSize, context),
            ),
      ),
    );
  }

  Widget _buildQuestionButtons() {
    return SizedBox.expand(
      child: FourScaleButtonGroup(
        onChange: onAnswerSelected,
        answerSelected: answerSelectedValue,
        responseOptions: question.responseOptions,
      ),
    );
  }
}
