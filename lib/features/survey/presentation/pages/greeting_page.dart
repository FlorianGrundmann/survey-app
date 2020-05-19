import 'package:flutter/material.dart';

import '../../../../core/values/survey_paths.dart';
import '../widgets/next_button.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ImagesPaths.healthProfessionals,
            width: 320,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Fragebogen zur Videoaufklärung',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
              'Liebe Patientin, lieber Patient,\n\nbitte nutzen Sie Gelegenheit, um uns mit dem folgenden Fragebogen Ihre Eindrücke mitzuteilen. \n\nIhre Antworten werden streng anonym gespeichert und ausgewertet und haben keinerlei Auswirkungen auf Ihre individuelle medizinische Behandlung.\n\nVielen Dank im Voraus! \n\nIhr Ärzte-Team',
              style: Theme.of(context).textTheme.headline6),
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
