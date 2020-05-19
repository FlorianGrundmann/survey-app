import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                //TODO Fix constructor, but state values in state
                question: state.question.text,
                onNext: (value) {},
                currentQuestion: 1,
                numberQuestions: 10);
          } else {
            return Container(child: Text('unknown state'));
          }
        },
      ),
    );
  }
}
