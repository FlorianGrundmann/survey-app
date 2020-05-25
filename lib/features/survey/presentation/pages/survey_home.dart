import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_app/features/survey/presentation/pages/admin_menu_page.dart';

import '../../../../injection_container.dart';
import '../bloc/survey_bloc.dart';
import 'greeting_page.dart';
import 'question_page.dart';
import 'thank_you_page.dart';

class SurveyHome extends StatefulWidget {
  @override
  _SurveyHomeState createState() => _SurveyHomeState();
}

class _SurveyHomeState extends State<SurveyHome> {
  final unknownStateTitle = 'unknown state';
  final loadingScreenTitle = 'loading';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SurveyBloc>(
      create: (context) => sl<SurveyBloc>(),
      child: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          if (state is GreetingState) {
            return GreetingPage();
          } else if (state is LoadingState) {
            //start loading screen
            return Container(
              child: Text(loadingScreenTitle),
            );
          } else if (state is QuestionState) {
            return new QuestionPage(
              key: UniqueKey(),
              questionState: state,
            );
          } else if (state is ThankYouState) {
            return ThankYouPage();
          } else if (state is AdminMenuState) {
            return AdminMenuPage();
          } else {
            return Container(child: Text(unknownStateTitle));
          }
        },
      ),
    );
  }
}
