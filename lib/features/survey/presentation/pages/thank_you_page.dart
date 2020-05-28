import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/survey_bloc.dart';
import '../fixed_values/survey_paths.dart';
import '../fixed_values/survey_sizes.dart';

class ThankYouPage extends StatelessWidget {
  final thankYouText = 'Vielen Dank!';

  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SurveySizes.paddingSize),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  ImagePaths.smileyHealthProfessionals,
                  width:
                      SurveySizes.scaledWidth(SurveySizes.imageWidth, context),
                ),
                SizedBox(
                    height: SurveySizes.scaledHeight(
                        SurveySizes.standardDistance, context)),
                Text(
                  thankYouText,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: SurveySizes.scaledWidth(
                          SurveySizes.bigFontSize, context)),
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
