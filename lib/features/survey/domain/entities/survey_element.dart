import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'question.dart';
part 'answer.dart';

class SurveyElement extends Equatable {
  final Question question;
  final Answer answer;

  SurveyElement({
    @required this.question,
    @required this.answer,
  });

  @override
  List<Object> get props => [question, answer];
}
