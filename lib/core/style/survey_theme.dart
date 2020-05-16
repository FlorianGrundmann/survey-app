import 'package:flutter/material.dart';

class SurveyTheme {
  //colors
  static Color appBackgroundColor = Colors.grey[100];
  static Color primaryColor = Colors.white;
  static Color secondaryColor = Color.fromRGBO(0, 119, 113, 1.0);
  static Color highlightColor = Color.fromRGBO(175, 205, 97, 1.0);
  static Color disabledColor = Colors.lightGreen[200];

  //text styles
  static TextStyle regularTextStyle = TextStyle(
    fontSize: 14.0,
  );
  static TextStyle questionTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 30.0,
    color: Colors.black,
  );
  static TextStyle buttonTextStyle = TextStyle(
    fontSize: 24,
    color: highlightColor,
  );

  //themes
  static ThemeData surveyTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColor,
    primaryColor: primaryColor,
    brightness: Brightness.light,
    buttonColor: secondaryColor,
    disabledColor: disabledColor,
    accentColor: secondaryColor,
    highlightColor: highlightColor,
    backgroundColor: highlightColor,
    buttonTheme: ButtonThemeData(
      buttonColor: secondaryColor,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
    ),
    textTheme: TextTheme(
      bodyText2: regularTextStyle,
      headline1: questionTextStyle,
      button: buttonTextStyle,
    ),
  );
}
