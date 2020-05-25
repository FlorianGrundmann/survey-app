import 'package:flutter/material.dart';

import 'custom_radio_button.dart';

class AnswerRadioGroup extends StatelessWidget {
  final firstOptionText = 'Trifft nicht zu';
  final secondOptionText = 'Trifft etwas zu';
  final thirdOptionText = 'Trifft ziemlich zu';
  final fourthOptionText = 'Trifft stark zu';

  final Function(int) _onChange;
  final int answerSelected;

  const AnswerRadioGroup({
    Key key,
    @required onChange,
    this.answerSelected,
  })  : _onChange = onChange,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomRadioButton(
            text: firstOptionText,
            onPressed: () {
              _onChange(0);
            },
            activated: (answerSelected == 0),
          ),
          CustomRadioButton(
            text: secondOptionText,
            onPressed: () {
              _onChange(1);
            },
            activated: (answerSelected == 1),
          ),
          CustomRadioButton(
            text: thirdOptionText,
            onPressed: () {
              _onChange(2);
            },
            activated: (answerSelected == 2),
          ),
          CustomRadioButton(
            text: fourthOptionText,
            onPressed: () {
              _onChange(3);
            },
            activated: (answerSelected == 3),
          ),
        ],
      ),
    );
  }
}
