part of 'survey_bloc.dart';

abstract class SurveyState extends Equatable {
  @override
  List<Object> get props => [];

  const SurveyState();
}

class GreetingState extends SurveyState {}

class LoadingState extends SurveyState {}

class QuestionState extends SurveyState {
  final SurveyElement surveyElement;

  @override
  List<Object> get props => [surveyElement];

  QuestionState(this.surveyElement);
}

class SavingState extends SurveyState {}

class ThankYouState extends SurveyState {}

class FailureState extends SurveyState {
  //TODO Add failure message.
}
