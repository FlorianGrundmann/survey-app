import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final bool activated;
  final Function onPressed;

  final double chevronSize = 40;

  const NextButton({
    Key key,
    @required this.activated,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: RaisedButton(
          elevation: 0.0,
          color: Color.fromRGBO(0, 119, 113, 1.0),
          disabledColor: Colors.lightGreen[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: chevronSize),
              Expanded(
                child: Center(
                  child: Text(
                    'Weiter',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(175, 205, 97, 1.0),
                    ),
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: chevronSize),
            ],
          ),
          onPressed: activated ? onPressed : null,
        ),
      ),
    );
  }
}
