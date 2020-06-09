import 'package:flutter/material.dart';

import '../fixed_values/survey_sizes.dart';
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
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: _text('Exportiere Fragen'),
              onTap: () => {Navigator.of(context).pop()},
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
}
