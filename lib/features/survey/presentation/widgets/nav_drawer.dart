import 'package:flutter/material.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../injection_container.dart';
import '../../domain/usecases/export_all_questions_usecase.dart';
import '../../domain/usecases/export_all_responses_usecase.dart';
import '../fixed_values/survey_sizes.dart';
import 'pin_pad.dart';
import 'survey_alert_dialog.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text _text(String text) {
      return Text(
        text,
        style: TextStyle(
          fontSize:
              SurveySizes.scaledHeight(SurveySizes.regularFontSize, context),
        ),
      );
    }

    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/phone-doctor.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: _text('Neue Umfrage'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SurveyAlertDialog(
                      onOk: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      body:
                          'Alle bisher ausgewählten Antworten gehen dabei verloren.',
                      title: 'Zur Startseite zurückkehren?',
                    );
                  },
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: _text('Exportiere Antworten'),
              onTap: () {
                Navigator.of(context).pop();
                _showLockScreen(context, _exportResponses);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: _text('Exportiere Fragen'),
              onTap: () {
                Navigator.of(context).pop();
                _showLockScreen(context, _exportQuestions);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: _text('Über App'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }

  void _exportResponses() {
    sl<ExportAllResponsesUseCase>().call(NoParams);
  }

  void _exportQuestions() {
    sl<ExportAllQuestionsUseCase>().call(NoParams);
  }

  void _showLockScreen(BuildContext context, Function onCorrect) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => PinPad(
          onCorrectPin: onCorrect,
        ),
      ),
    );
  }
}
