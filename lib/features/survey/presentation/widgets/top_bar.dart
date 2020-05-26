import 'package:flutter/material.dart';
import '../fixed_values/survey_sizes.dart';

class TopBar extends StatelessWidget {
  final String seperatorText = 'von';

  final double paddingWidth = SurveySizes.paddingSize;
  final double backButtonWidth = SurveySizes.paddingSize * 2;

  final int currentQuestion;
  final int numberQuestions;

  final Function onBackButtonTap;

  const TopBar({
    Key key,
    @required this.currentQuestion,
    @required this.numberQuestions,
    @required this.onBackButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildBackButton(context),
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

  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: backButtonWidth,
      child: FlatButton(
        onPressed: onBackButtonTap,
        child: Icon(
          Icons.chevron_left,
          size: SurveySizes.scaledWidth(SurveySizes.buttonIconSize, context),
        ),
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).primaryTextTheme.bodyText2.copyWith(
                fontSize: SurveySizes.scaledWidth(
                    SurveySizes.regularFontSize, context),
              ),
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
