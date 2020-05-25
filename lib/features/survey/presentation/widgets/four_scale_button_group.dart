import 'package:flutter/material.dart';
import 'package:survey_app/features/survey/domain/entities/response_option.dart';

import 'custom_radio_button.dart';

class FourScaleButtonGroup extends StatelessWidget {
  final Function(ResponseOption) _onChange;
  final ResponseOption answerSelected;
  final List<ResponseOption> responseOptions;

  const FourScaleButtonGroup({
    Key key,
    @required onChange,
    this.answerSelected,
    @required this.responseOptions,
  })  : _onChange = onChange,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < responseOptions.length; i++)
            CustomRadioButton(
                text: responseOptions[i].displayText,
                onPressed: () {
                  _onChange(responseOptions[i]);
                },
                activated: (answerSelected == responseOptions[i])),
        ],
      ),
    );
  }
}
