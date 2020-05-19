part of 'survey_bloc.dart';

abstract class SurveyEvent extends Equatable {
  @override
  List<Object> get props => [];

  const SurveyEvent();
}

class LoadQuestionsEvent extends SurveyEvent {}

class SubmitAnswersEvent extends SurveyEvent {}

class NextQuestionEvent extends SurveyEvent {}
