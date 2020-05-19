import 'package:survey_app/features/survey/data/datasources/local_data_source.dart';
import 'package:survey_app/features/survey/data/model/question_model.dart';

class HardCodedQuestionsDataSource implements LocalDataSource {
  List<QuestionModel> _questions = [
    QuestionModel('Es war zu viel Text auf den Folien.'),
    QuestionModel('Die Stimme des Sprechers war angenehm.'),
    QuestionModel('Der Sprecher sprach zu schnell oder undeutlich.'),
  ];

  @override
  Future<List<QuestionModel>> loadAllQuestions() async {
    return _questions;
  }
}
