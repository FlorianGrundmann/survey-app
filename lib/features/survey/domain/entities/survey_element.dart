import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'question.dart';
part 'response_option.dart';

///The survey is made of a list of survey elements.
///A survey element is a combination of a question and response options.
class SurveyElement extends Equatable {
  final Question question;
  final List<ResponseOption> responseOptions;

  SurveyElement({
    @required this.question,
    @required this.responseOptions,
  });

  @override
  List<Object> get props => [question, responseOptions];
}
