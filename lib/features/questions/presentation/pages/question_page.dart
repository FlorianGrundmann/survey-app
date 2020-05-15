import 'package:flutter/material.dart';
import 'package:survey_app/features/questions/presentation/widgets/custom_radio_button.dart';
import 'package:survey_app/features/questions/presentation/widgets/top_bar.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final double paddingWidth = 50;
  final double buttonHeight = 70;
  final double chevronSize = 40;

  final int currentQuestion = 5;
  final int numberQuestions = 10;

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
                  _buildQuestion(),
                  _buildNextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildQuestionText(),
          ),
          Expanded(
            flex: 2,
            child: _buildQuestionButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionText() {
    return Container(
      padding: EdgeInsets.all(paddingWidth),
      //color: Colors.blue,
      child: Container(
        //color: Colors.cyan,
        child: Text(
          'Der Ablauf der Anästhesie sollte besser erläutert werden.',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  Widget _buildQuestionButtons() {
    return SizedBox.expand(
      child: Container(
          //color: Colors.red,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomRadioButton(text: 'Trifft nicht zu', onPressed: () {}),
          CustomRadioButton(text: 'Trifft etwas zu', onPressed: () {}),
          CustomRadioButton(
            text: 'Trifft ziemlich zu',
            onPressed: () {},
            activated: true,
          ),
          CustomRadioButton(text: 'Triff stark zu', onPressed: () {}),
        ],
      )),
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
          disabledColor: Colors.greenAccent[100],
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
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: chevronSize),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
