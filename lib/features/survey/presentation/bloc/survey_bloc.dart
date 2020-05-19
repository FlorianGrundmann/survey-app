import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/question.dart';
import '../../domain/usecases/start_survey_usecase.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final StartSurveyUsecase startSurveyUsecase;

  SurveyBloc({@required this.startSurveyUsecase});

  @override
  SurveyState get initialState => GreetingState();

  @override
  Stream<SurveyState> mapEventToState(
    SurveyEvent event,
  ) async* {
    if (event is StartSurveyEvent) {
      yield LoadingState();
      Either<Failure, List<Question>> result =
          await startSurveyUsecase(NoParams);
      yield result.fold(
        (failure) => FailureState(),
        (questions) => QuestionState(questions[0]),
      );
    }
  }
}
