import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/survey_data.dart';
import '../repositories/survey_data_repository.dart';

class SubmitSurveyUsecase extends UseCase<Success, SurveyData> {
  final SurveyDataRepository repository;

  SubmitSurveyUsecase(this.repository);

  @override
  Future<Either<Failure, Success>> call(SurveyData data) {
    return repository.saveSurveyData(data);
  }
}
