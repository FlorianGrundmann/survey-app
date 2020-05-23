part of 'survey_bloc.dart';

abstract class SurveyState extends Equatable {
  @override
  List<Object> get props => [];

  const SurveyState();
}

///State in which a greeting is shown to the user.
class GreetingState extends SurveyState {}

///State in which the app is currently loading.
class LoadingState extends SurveyState {}

///State in which a question is shown to the user.
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

///State in which the app is currently saving.
class SavingState extends SurveyState {}

///State in which the user is thanked for participating in the survey.
class ThankYouState extends SurveyState {}

class FailureState extends SurveyState {}

class AdminMenuState extends SurveyState {}
