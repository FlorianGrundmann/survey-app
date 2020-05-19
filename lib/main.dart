import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/values/styles/survey_styles.dart';
import 'features/survey/presentation/pages/thank_you_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      theme: SurveyTheme.surveyTheme,
      home: Scaffold(
        body: ThankYouPage(),
      ),
    );
  }
}
