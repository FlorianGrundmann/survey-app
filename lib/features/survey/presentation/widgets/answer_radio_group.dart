import 'package:flutter/material.dart';

import 'custom_radio_button.dart';

class AnswerRadioGroup extends StatelessWidget {
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
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomRadioButton(
            text: 'Trifft nicht zu',
            onPressed: () {
              _onChange(0);
            },
            activated: (answerSelected == 0),
          ),
          CustomRadioButton(
            text: 'Trifft etwas zu',
            onPressed: () {
              _onChange(1);
            },
            activated: (answerSelected == 1),
          ),
          CustomRadioButton(
            text: 'Trifft ziemlich zu',
            onPressed: () {
              _onChange(2);
            },
            activated: (answerSelected == 2),
          ),
          CustomRadioButton(
            text: 'Trifft stark zu',
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
