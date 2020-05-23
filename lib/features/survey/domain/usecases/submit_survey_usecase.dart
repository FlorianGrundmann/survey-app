import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/survey_data.dart';
import '../repositories/response_data_repository.dart';

class SubmitResponseUseCase extends UseCase<Success, List<SurveyData>> {
  final ResponseDataRepository repository;

  SubmitResponseUseCase({
    @required this.repository,
  });

  @override
  Future<Either<Failure, Success>> call(List<SurveyData> survey) {
    return repository.saveResponse(survey);
  }
}
