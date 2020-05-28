import 'package:flutter/material.dart';

import 'scaling_button.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final bool activated;
  final Function onPressed;

  const CustomRadioButton({
    Key key,
    this.activated = false,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScalingButton(
      text: text,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).primaryColor,
      activated: activated,
      activatedTextColor: Theme.of(context).accentColor,
      disabledTextColor: Colors.black,
      borderSide: BorderSide(
        width: 3.0,
        color: activated
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
      ),
    );
  }
}
