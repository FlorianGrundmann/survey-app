import '../model/survey_element_model.dart';

abstract class LocalQuestionDataSource {
  Future<List<SurveyElementModel>> loadAllQuestions();
}
