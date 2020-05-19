import 'package:flutter/material.dart';

import 'survey_styles.dart';

class SurveyTextStyles {
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
    color: SurveyColors.highlightColor,
  );
}
