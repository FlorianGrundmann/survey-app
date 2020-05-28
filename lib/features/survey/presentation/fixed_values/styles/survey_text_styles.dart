part of 'survey_theme.dart';

class SurveyTextStyles {
  static TextStyle regularTextStyle = TextStyle(
    fontSize: SurveySizes.regularFontSize,
  );
  static TextStyle questionTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: SurveySizes.questionFontSize,
    color: Colors.black,
  );
  static TextStyle buttonTextStyle = TextStyle(
    fontSize: SurveySizes.buttonFontSize,
    color: SurveyColors.highlightColor,
  );

  SurveyTextStyles._();
}
