import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final double paddingWidth;
  final double backButtonWidth;

  final int currentQuestion;
  final int numberQuestions;

  final Function onBackButtonTap;

  const TopBar({
    Key key,
    this.paddingWidth = 50,
    @required this.currentQuestion,
    @required this.numberQuestions,
    @required this.onBackButtonTap,
  })  : backButtonWidth = paddingWidth * 2,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildBackButton(),
              Expanded(
                child: _buildCounter(),
              ),
              SizedBox(width: backButtonWidth)
            ],
          ),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return SizedBox(
      width: backButtonWidth,
      child: FlatButton(
        onPressed: () {},
        child: Icon(
          Icons.chevron_left,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
                text: '$currentQuestion',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' von $numberQuestions'),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth),
      child: Column(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(175, 205, 97, 1.0),
            valueColor:
                AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 119, 113, 1.0)),
            value: currentQuestion.toDouble() / numberQuestions.toDouble(),
          ),
        ],
      ),
    );
  }
}
