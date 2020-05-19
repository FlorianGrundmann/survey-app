import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/values/styles/survey_styles.dart';
import 'features/survey/presentation/pages/survey_home.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      theme: SurveyTheme.surveyTheme,
      home: Scaffold(
        body: SurveyHome(),
      ),
    );
  }
}
