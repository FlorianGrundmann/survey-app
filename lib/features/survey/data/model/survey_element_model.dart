import '../../domain/entities/survey_element.dart';

class SurveyElementModel extends SurveyElement {
  SurveyElementModel(String text)
      : super(question: Question(text), answer: Answer());
}
