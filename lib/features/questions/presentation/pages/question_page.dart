import 'package:flutter/material.dart';
import 'package:survey_app/features/questions/presentation/widgets/top_bar.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth;

  final int currentQuestion = 5;
  final int numberQuestions = 10;

  _QuestionPageState({this.paddingWidth = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: paddingWidth),
      child: TopBar(
        currentQuestion: currentQuestion,
        numberQuestions: numberQuestions,
        onBackButtonTap: () {},
      ),
    );
  }
}
