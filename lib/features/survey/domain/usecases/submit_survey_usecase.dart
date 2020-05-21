import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/survey_element.dart';
import '../repositories/survey_data_repository.dart';

class SubmitSurveyUseCase extends UseCase<Success, List<SurveyElement>> {
  final SurveyDataRepository repository;

  SubmitSurveyUseCase({
    @required this.repository,
  });

  @override
  Future<Either<Failure, Success>> call(List<SurveyElement> survey) {
    return repository.saveSurveyData(survey);
  }
}
