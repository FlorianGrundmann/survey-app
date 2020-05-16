import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 70,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(
            width: 3.0,
            color: activated
                ? Theme.of(context).accentColor
                : Theme.of(context).primaryColor,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: activated ? Theme.of(context).accentColor : Colors.black,
            fontSize: 18,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
