part of 'survey_bloc.dart';

abstract class SurveyEvent extends Equatable {
  @override
  List<Object> get props => [];

  const SurveyEvent();
}

///Event that should be fired when the user wants to start the survey.
class StartSurveyEvent extends SurveyEvent {}

///Event that should be fired when the user wants to submit his answers.
class SubmitAnswersEvent extends SurveyEvent {}

///Event that should be fired when the user wants to move to the next question.
class NextQuestionEvent extends SurveyEvent {}

///Event that should be fired when the user wants to move back to the previous question.
class PreviousQuestionEvent extends SurveyEvent {}

///Event that should be fired when the user wants to restart the the app.
///For example to do another survey.
class RestartEvent extends SurveyEvent {}

///Event that should be fired when teh user wants to open the admin menu.
class OpenAdminMenuEvent extends SurveyEvent {}
