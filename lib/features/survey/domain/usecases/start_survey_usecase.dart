import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/question.dart';
import '../repositories/questions_repository.dart';

class StartSurveyUsecase extends UseCase {
  final QuestionsRepository repository;

  StartSurveyUsecase({this.repository});

  @override
  Future<Either<Failure, List<Question>>> call(params) {
    return repository.loadAllQuestions();
  }
}
