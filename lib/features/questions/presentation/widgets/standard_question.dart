import 'package:flutter/material.dart';

import 'answer_radio_group.dart';

class StandardQuestion extends StatelessWidget {
  final double paddingWidth = 50;

  final questionText;
  final onAnswerSelected;
  final answerSelectedValue;

  const StandardQuestion({
    Key key,
    @required this.questionText,
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
    return Container(
      padding: EdgeInsets.all(paddingWidth),
      child: Container(
        child: Text(
          questionText,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  Widget _buildQuestionButtons() {
    return SizedBox.expand(
      child: AnswerRadioGroup(
        onChange: onAnswerSelected,
        answerSelected: answerSelectedValue,
      ),
    );
  }
}
