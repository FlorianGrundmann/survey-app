part of 'survey_element.dart';

class Answer extends Equatable {
  int answerIndex;

  Answer([this.answerIndex]);

  @override
  List<Object> get props => [answerIndex];
}
