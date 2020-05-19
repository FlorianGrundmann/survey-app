import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_app/features/survey/presentation/pages/greeting_page.dart';

import '../../../../injection_container.dart';
import '../bloc/survey_bloc.dart';

class SurveyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SurveyBloc>(
      create: (context) => sl<SurveyBloc>(),
      child: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          if (state is GreetingState) {
            return GreetingPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
