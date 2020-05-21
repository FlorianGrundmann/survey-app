import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/answer.dart';
import '../repositories/survey_data_repository.dart';

class SubmitSurveyUseCase extends UseCase<Success, Answer> {
  final SurveyDataRepository repository;

  SubmitSurveyUseCase(this.repository);

  @override
  Future<Either<Failure, Success>> call(Answer data) {
    return repository.saveSurveyData(data);
  }
}
