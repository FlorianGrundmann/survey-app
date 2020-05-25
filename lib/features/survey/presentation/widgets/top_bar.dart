import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String seperatorText = 'von';

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
                child: _buildCounter(context),
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
        onPressed: onBackButtonTap,
        child: Icon(
          Icons.chevron_left,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).primaryTextTheme.bodyText2,
          children: <TextSpan>[
            TextSpan(
                text: '$currentQuestion',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' $seperatorText $numberQuestions'),
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
            value: currentQuestion.toDouble() / numberQuestions.toDouble(),
          ),
        ],
      ),
    );
  }
}
