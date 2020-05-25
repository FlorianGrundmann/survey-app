import 'package:flutter/material.dart';

part 'survey_colors.dart';
part 'survey_text_styles.dart';

class SurveyTheme {
  static ThemeData surveyTheme = ThemeData(
    scaffoldBackgroundColor: SurveyColors.appBackgroundColor,
    primaryColor: SurveyColors.primaryColor,
    accentColor: SurveyColors.secondaryColor,
    highlightColor: SurveyColors.highlightColor,
    brightness: Brightness.light,
    buttonColor: SurveyColors.secondaryColor,
    disabledColor: SurveyColors.disabledColor,
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

  SurveyTheme._();
}
