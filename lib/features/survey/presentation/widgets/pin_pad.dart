import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../fixed_values/survey_sizes.dart';

class PinPad extends StatefulWidget {
  final Function onCorrectPin;
  PinPad({
    Key key,
    @required this.onCorrectPin,
  }) : super(key: key);

  @override
  _PinPadState createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    final _keyboardUiConfig = KeyboardUIConfig(
      primaryColor: Theme.of(context).accentColor,
      digitBorderWidth: SurveySizes.scaledWidth(3.0, context),
      deleteButtonTextStyle: TextStyle(
        fontSize: SurveySizes.scaledWidth(20.0, context),
        color: Colors.white,
      ),
    );

    return PasscodeScreen(
      title: Text(
        'Enter App Passcode',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: SurveySizes.scaledWidth(45.0, context),
        ),
      ),
      circleUIConfig: CircleUIConfig(
        borderColor: Theme.of(context).accentColor,
        fillColor: Theme.of(context).accentColor,
        borderWidth: SurveySizes.scaledWidth(3.0, context),
        circleSize: SurveySizes.scaledWidth(30.0, context),
      ),
      keyboardUIConfig: _keyboardUiConfig,
      passwordEnteredCallback: _onPasscodeEntered,
      cancelButton: Text(
        'Abbruch',
        style: TextStyle(
          fontSize: SurveySizes.scaledWidth(20.0, context),
          color: Colors.white,
        ),
        semanticsLabel: 'Cancel',
      ),
      deleteButton: Text(
        'Lösche',
        style: _keyboardUiConfig.deleteButtonTextStyle,
        semanticsLabel: 'Delete',
      ),
      shouldTriggerVerification: _verificationNotifier.stream,
      backgroundColor: Colors.black.withOpacity(0.8),
      cancelCallback: _onPasscodeCancelled,
    );
  }

  _onPasscodeEntered(String enteredPasscode) {
    var hashOriginal = sha256.convert(utf8.encode('123456')).toString();
    var hashEntered = sha256.convert(utf8.encode(enteredPasscode)).toString();
    bool isValid = hashOriginal == hashEntered;
    _verificationNotifier.add(isValid);
    if (isValid) {
      widget.onCorrectPin();
    }
    /*if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });*/
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
