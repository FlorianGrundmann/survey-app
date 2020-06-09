import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/survey/presentation/fixed_values/styles/survey_theme.dart';
import 'features/survey/presentation/pages/survey_home.dart';
import 'features/survey/presentation/widgets/nav_drawer.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SurveyTheme.surveyTheme,
      home: Scaffold(
        drawer: NavDrawer(),
        drawerDragStartBehavior: DragStartBehavior.start,
        body: SurveyHome(),
      ),
    );
  }
}
