import 'package:survey_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/repositories/response_data_repository.dart';

class ExportAllResponsesUsecase extends UseCase {
  final ResponseDataRepository repository;

  ExportAllResponsesUsecase(this.repository);

  @override
  Future<Either<Failure, Success>> call(params) {
    return repository.exportAll();
  }
}
