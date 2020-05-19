import 'package:survey_app/features/survey/data/model/question_model.dart';

abstract class LocalDataSource {
  Future<List<QuestionModel>> loadAllQuestions();
}
