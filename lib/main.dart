import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_app/features/questions/presentation/pages/greeting_page.dart';
import 'package:survey_app/features/questions/presentation/pages/main_question_page.dart';
import 'package:survey_app/features/questions/presentation/pages/thank_you_page.dart';

import 'core/style/survey_theme.dart';

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
