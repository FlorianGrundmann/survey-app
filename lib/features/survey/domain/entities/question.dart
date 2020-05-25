import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'response_option.dart';

///The survey is made of a list of [Question].
///A [Question] is a combination of a question and a list of [ResponseOption].
class Question extends Equatable {
  final String questionText;
  final List<ResponseOption> responseOptions;

  Question({
    @required this.questionText,
    @required this.responseOptions,
  });

  @override
  List<Object> get props => [questionText, responseOptions];
}
