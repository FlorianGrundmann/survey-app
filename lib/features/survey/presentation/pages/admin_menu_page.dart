import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/survey_paths.dart';
import '../bloc/survey_bloc.dart';

class AdminMenuPage extends StatelessWidget {
  const AdminMenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleAdminMenu = 'Admin Menu';
    var newSurveyButtonText = 'Fragebogen für neuen Patienten starten';

    return Container(
      padding: EdgeInsets.all(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              ImagePaths.healthProIcon,
              color: Theme.of(context).accentColor,
              width: 320,
            ),
            SizedBox(height: 30),
            Text(
              titleAdminMenu,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<SurveyBloc>(context).add(RestartEvent());
                },
                child: Text(
                  newSurveyButtonText,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
