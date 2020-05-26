import 'package:flutter/material.dart';
import 'package:survey_app/features/survey/presentation/fixed_values/survey_sizes.dart';

class ScalingButton extends StatelessWidget {
  final BorderSide borderSide;
  final String text;
  final bool activated;
  final bool reactOnlyWhenActivated;
  final double fontSize;
  final double height;
  final double width;
  final Function onPressed;
  final Color color;
  final Color disabledColor;
  final Color activatedTextColor;
  final Color disabledTextColor;

  const ScalingButton({
    Key key,
    this.borderSide,
    @required this.text,
    this.activated = true,
    this.reactOnlyWhenActivated = true,
    this.fontSize = SurveySizes.buttonFontSize,
    @required this.onPressed,
    this.color,
    this.disabledColor,
    this.activatedTextColor,
    this.disabledTextColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height:
          SurveySizes.scaledHeight(height ?? SurveySizes.buttonSize, context),
      child: RaisedButton(
        color: color ?? Theme.of(context).primaryColor,
        disabledColor: disabledColor ?? Theme.of(context).primaryColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: borderSide,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: activated
                ? activatedTextColor ?? Theme.of(context).accentColor
                : disabledTextColor ?? Colors.black,
            fontSize: SurveySizes.scaledHeight(
                fontSize ?? SurveySizes.buttonFontSize, context),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
