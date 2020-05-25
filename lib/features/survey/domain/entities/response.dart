import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'question.dart';
import 'response_option.dart';

class Response extends Equatable {
  final Question questionRespondedTo;
  final ResponseOption selectedResponse;

  Response({
    @required this.questionRespondedTo,
    @required this.selectedResponse,
  });

  @override
  List<Object> get props => [questionRespondedTo, selectedResponse];
}
