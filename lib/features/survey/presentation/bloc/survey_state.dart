part of 'survey_bloc.dart';

abstract class SurveyState extends Equatable {
  @override
  List<Object> get props => [];

  const SurveyState();
}

class GreetingState extends SurveyState {}

class LoadingState extends SurveyState {}

class QuestionsState extends SurveyState {}

class SavingState extends SurveyState {}

class ThankYouState extends SurveyState {}
