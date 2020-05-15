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
        color: Colors.white,
        disabledColor: Colors.white,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(
            width: 3.0,
            color: activated ? Color.fromRGBO(0, 119, 113, 1.0) : Colors.white,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: activated ? Color.fromRGBO(0, 119, 113, 1.0) : Colors.black,
            fontSize: 18,
          ),
        ),
        onPressed: activated ? onPressed : null,
      ),
    );
  }
}
