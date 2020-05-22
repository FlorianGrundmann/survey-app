import 'package:flutter/material.dart';

import '../../../../core/values/survey_paths.dart';

class AdminMenuPage extends StatelessWidget {
  const AdminMenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              ImagesPaths.healthProIcon,
              color: Theme.of(context).accentColor,
              width: 320,
            ),
            SizedBox(height: 30),
            Text(
              'Admin Menu',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Start New Survey',
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
