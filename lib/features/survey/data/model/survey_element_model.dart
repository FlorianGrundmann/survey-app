import '../../domain/entities/question.dart';
import '../../domain/entities/response_option.dart';

class SurveyElementModel extends Question {
  SurveyElementModel(String text)
      : super(questionText: text, responseOptions: [ResponseOption<int>(0)]);
}
