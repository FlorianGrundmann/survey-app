import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:survey_app/features/survey/domain/entities/survey_element.dart';

class SurveyData extends Equatable {
  final SurveyElement surveyElement;
  final ResponseOption userResponse;

  SurveyData({
    @required this.surveyElement,
    @required this.userResponse,
  });

  @override
  List<Object> get props => [surveyElement, userResponse];
}
