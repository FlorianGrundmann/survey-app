import '../model/survey_element_model.dart';

abstract class LocalDataSource {
  Future<List<SurveyElementModel>> loadAllQuestions();
}
