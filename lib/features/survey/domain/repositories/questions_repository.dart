import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/question.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<Question>>> loadAllQuestions();
}
