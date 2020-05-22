import 'package:flutter/material.dart';

import '../../../../core/values/survey_paths.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            right: 0.0,
            child: new IconButton(
                iconSize: 50.0,
                icon: Image.asset(
                  ImagesPaths.stetoscopeIcon,
                ),
                onPressed: () {}),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  ImagesPaths.smileyHealthProfessionals,
                  width: 320,
                ),
                SizedBox(height: 30),
                Text(
                  'Vielen Dank!',
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
