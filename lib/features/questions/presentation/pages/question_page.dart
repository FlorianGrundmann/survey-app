import 'package:flutter/material.dart';
import 'package:survey_app/features/questions/presentation/widgets/standard_question.dart';

import '../widgets/top_bar.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth = 50;
  final double buttonHeight = 70;
  final double chevronSize = 40;

  final int currentQuestion = 2;
  final int numberQuestions = 10;

  int _answerSelected;

  _QuestionPageState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.only(top: paddingWidth),
      child: Column(
        children: <Widget>[
          TopBar(
            currentQuestion: currentQuestion,
            numberQuestions: numberQuestions,
            onBackButtonTap: () {},
          ),
          Expanded(
            child: Container(
              //color: Colors.green,
              margin: EdgeInsets.all(paddingWidth),
              child: Column(
                children: <Widget>[
                  StandardQuestion(
                    questionText:
                        'Der Ablauf der Anästhesie sollte besser erläutert werden.',
                    answerSelectedValue: _answerSelected,
                    onAnswerSelected: (value) {
                      setState(() {
                        _answerSelected = value;
                      });
                    },
                  ),
                  _buildNextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: RaisedButton(
          elevation: 0.0,
          color: Color.fromRGBO(0, 119, 113, 1.0),
          disabledColor: Colors.lightGreen[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: chevronSize),
              Expanded(
                child: Center(
                  child: Text(
                    'Weiter',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(175, 205, 97, 1.0),
                    ),
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: chevronSize),
            ],
          ),
          onPressed: _answerSelected != null ? () {} : null,
        ),
      ),
    );
  }
}
