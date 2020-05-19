import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  @override
  SurveyState get initialState => GreetingState();

  @override
  Stream<SurveyState> mapEventToState(
    SurveyEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
