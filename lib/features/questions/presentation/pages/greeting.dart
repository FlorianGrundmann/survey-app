import 'package:flutter/material.dart';
import 'package:survey_app/core/constants/paths.dart';
import 'package:survey_app/features/questions/presentation/widgets/next_button.dart';

class Greeting extends StatelessWidget {
  const Greeting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(ImagesPaths.healthProfessionals),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem Ipsum',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 10,
          ),
          NextButton(
            activated: true,
            onPressed: () {},
            text: 'Start',
          ),
        ],
      ),
    );
  }
}
