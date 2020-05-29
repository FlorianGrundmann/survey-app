import '../../domain/entities/rating_question.dart';

///Interface for a local data source where the survey questions are stored.
abstract class LocalQuestionDataSource {
  Future<List<RatingQuestion>> loadAllQuestions();
}
