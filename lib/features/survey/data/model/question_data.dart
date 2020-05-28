import 'package:flutter/foundation.dart';

import '../../domain/entities/question.dart';
import '../../domain/entities/response_option.dart';

class QuestionData extends Question {
  final String id;

  QuestionData({
    @required this.id,
    @required String text,
    @required List<ResponseOption> responseOptions,
  }) : super(questionText: text, responseOptions: responseOptions);
}
