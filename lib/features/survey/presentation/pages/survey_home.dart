import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_app/features/survey/presentation/pages/thank_you_page.dart';

import '../../../../injection_container.dart';
import '../bloc/survey_bloc.dart';
import 'greeting_page.dart';
import 'question_page.dart';

class SurveyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SurveyBloc>(
      create: (context) => sl<SurveyBloc>(),
      child: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          if (state is GreetingState) {
            return GreetingPage();
          } else if (state is LoadingState) {
            //TODO Loading Screen
            return Container(
              child: Text('loading'),
            );
          } else if (state is QuestionState) {
            return QuestionPage(
              questionState: state,
            );
          } else if (state is ThankYouState) {
            return ThankYouPage();
          } else {
            return Container(child: Text('unknown state'));
          }
        },
      ),
    );
  }
}
