part of 'survey_element.dart';

class ResponseOption extends Equatable {
  final int answerIndex;

  ResponseOption([this.answerIndex]);

  @override
  List<Object> get props => [answerIndex];
}
