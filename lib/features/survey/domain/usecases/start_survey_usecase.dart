import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/survey_element.dart';
import '../repositories/questions_repository.dart';

class StartSurveyUseCase extends UseCase {
  final QuestionsRepository repository;

  StartSurveyUseCase({
    @required this.repository,
  });

  @override
  Future<Either<Failure, List<SurveyElement>>> call(params) {
    return repository.loadAllQuestions();
  }
}
