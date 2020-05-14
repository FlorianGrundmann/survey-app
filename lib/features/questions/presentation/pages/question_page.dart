import 'package:flutter/material.dart';

import '../widgets/progress_bar.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(45.0, 50.0, 45.0, 45.0),
        child: Column(
          children: <Widget>[
            ProgressBar(),
          ],
        ));
  }
}
