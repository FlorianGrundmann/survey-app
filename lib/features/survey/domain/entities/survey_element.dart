import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'question.dart';
part 'answer.dart';

class SurveyElement {
  final Question question;
  final Answer answer;

  SurveyElement({
    @required this.question,
    @required this.answer,
  });
}
