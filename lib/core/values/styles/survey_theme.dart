import 'package:flutter/material.dart';

import 'survey_styles.dart';

class SurveyTheme {
  static ThemeData surveyTheme = ThemeData(
    scaffoldBackgroundColor: SurveyColors.appBackgroundColor,
    primaryColor: SurveyColors.primaryColor,
    brightness: Brightness.light,
    buttonColor: SurveyColors.secondaryColor,
    disabledColor: SurveyColors.disabledColor,
    accentColor: SurveyColors.secondaryColor,
    highlightColor: SurveyColors.highlightColor,
    backgroundColor: SurveyColors.highlightColor,
    buttonTheme: ButtonThemeData(
      buttonColor: SurveyColors.secondaryColor,
      disabledColor: SurveyColors.disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
    ),
    textTheme: TextTheme(
      bodyText2: SurveyTextStyles.regularTextStyle,
      headline1: SurveyTextStyles.questionTextStyle,
      button: SurveyTextStyles.buttonTextStyle,
    ),
  );
}
