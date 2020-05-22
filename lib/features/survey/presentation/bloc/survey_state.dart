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
  final int questionIndex;
  final int numberTotalQuestions;

  @override
  List<Object> get props =>
      [surveyElement, questionIndex, numberTotalQuestions];

  QuestionState({
    @required this.surveyElement,
    @required this.questionIndex,
    @required this.numberTotalQuestions,
  });
}

class SavingState extends SurveyState {}

class ThankYouState extends SurveyState {}

class FailureState extends SurveyState {
  //TODO Add failure message.
}

class AdminMenuState extends SurveyState {}
