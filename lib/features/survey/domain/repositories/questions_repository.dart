import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/survey_element.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<SurveyElement>>> loadAllQuestions();
}
