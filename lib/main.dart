import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/questions/presentation/pages/question_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home: Scaffold(
        body: QuestionPage(),
      ),
    );
  }
}
