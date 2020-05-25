import '../model/rating_question_model.dart';

///Interface for a local data source where the survey questions are stored.
abstract class LocalQuestionDataSource {
  Future<List<RatingQuestionModel>> loadAllQuestions();
}
