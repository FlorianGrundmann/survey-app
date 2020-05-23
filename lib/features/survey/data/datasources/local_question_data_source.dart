import '../model/survey_element_model.dart';

///Interface for a local data source where the survey questions are stored.
abstract class LocalQuestionDataSource {
  Future<List<SurveyElementModel>> loadAllQuestions();
}
