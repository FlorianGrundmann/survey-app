import 'package:flutter/material.dart';

import '../fixed_values/survey_sizes.dart';

class SurveyAlertDialog extends StatelessWidget {
  final String title;
  final String body;
  final Function onOk;

  const SurveyAlertDialog({
    Key key,
    @required this.onOk,
    @required this.body,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize:
              SurveySizes.scaledWidth(SurveySizes.questionFontSize, context),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        body,
        style: TextStyle(
          fontSize:
              SurveySizes.scaledWidth(SurveySizes.questionFontSize, context),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            onOk();
          },
          child: Text(
            'Ok',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: SurveySizes.scaledWidth(
                SurveySizes.questionFontSize,
                context,
              ),
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Abbruch',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: SurveySizes.scaledWidth(
                  SurveySizes.questionFontSize, context),
            ),
          ),
        )
      ],
    );
  }
}
