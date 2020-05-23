import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'question.dart';
part 'answer.dart';

///The survey is made of a list of survey elements.
///A survey element is a combination of a question and answer.
class SurveyElement {
  final Question question;
  final Answer answer;

  SurveyElement({
    @required this.question,
    @required this.answer,
  });
}
