import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final bool activated;
  final Function onPressed;
  final String text;

  final double chevronSize = 40;

  const NextButton({
    Key key,
    @required this.activated,
    @required this.onPressed,
    this.text,
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
          child: Row(
            children: <Widget>[
              SizedBox(width: chevronSize),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.button,
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
