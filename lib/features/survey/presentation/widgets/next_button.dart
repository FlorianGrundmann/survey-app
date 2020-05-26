import 'package:flutter/material.dart';
import 'package:survey_app/features/survey/presentation/fixed_values/survey_sizes.dart';

class NextButton extends StatelessWidget {
  final bool activated;
  final Function onPressed;
  final String text;

  final double chevronSize = 40;

  const NextButton({
    Key key,
    @required this.activated,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SurveySizes.scaledHeight(SurveySizes.standardDistance, context)),
      child: SizedBox(
        width: double.infinity,
        height: SurveySizes.scaledHeight(SurveySizes.buttonSize, context),
        child: RaisedButton(
          elevation: 0.0,
          child: Row(
            children: <Widget>[
              SizedBox(width: SurveySizes.scaledHeight(chevronSize, context)),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.button.copyWith(
                          fontSize: SurveySizes.scaledHeight(
                              SurveySizes.buttonFontSize, context),
                        ),
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: SurveySizes.scaledHeight(chevronSize, context),
              ),
            ],
          ),
          onPressed: activated ? onPressed : null,
        ),
      ),
    );
  }
}
