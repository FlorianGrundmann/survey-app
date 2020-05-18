import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/style/survey_theme.dart';
import 'features/questions/presentation/pages/greeting.dart';

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
        body: Greeting(),
      ),
    );
  }
}
