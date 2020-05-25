import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/survey_paths.dart';
import '../bloc/survey_bloc.dart';

class ThankYouPage extends StatelessWidget {
  final thankYouText = 'Vielen Dank!';

  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  ImagePaths.smileyHealthProfessionals,
                  width: 320,
                ),
                SizedBox(height: 30),
                Text(
                  thankYouText,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<SurveyBloc>(context).add(OpenAdminMenuEvent());
            },
          ),
        ],
      ),
    );
  }
}
