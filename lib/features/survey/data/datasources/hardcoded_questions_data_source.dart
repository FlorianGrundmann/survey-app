import '../model/survey_element_model.dart';
import 'local_question_data_source.dart';

class HardCodedQuestionsDataSource implements LocalQuestionDataSource {
  @override
  Future<List<SurveyElementModel>> loadAllQuestions() async {
    return [
      SurveyElementModel('Es war zu viel Text auf den Folien.'),
      SurveyElementModel('Die Stimme des Sprechers war angenehm.'),
      SurveyElementModel('Der Sprecher sprach zu schnell oder undeutlich.'),
    ];
  }
}
