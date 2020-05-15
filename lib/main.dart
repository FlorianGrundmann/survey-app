import 'package:flutter/material.dart';

import 'features/questions/presentation/pages/question_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: QuestionPage(),
      ),
    );
  }
}
