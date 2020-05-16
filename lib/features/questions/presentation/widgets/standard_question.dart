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
            child: _buildQuestionText(),
          ),
          Expanded(
            flex: 2,
            child: _buildQuestionButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionText() {
    return Container(
      padding: EdgeInsets.all(paddingWidth),
      //color: Colors.blue,
      child: Container(
        //color: Colors.cyan,
        child: Text(
          questionText,
          style: TextStyle(fontSize: 30),
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
