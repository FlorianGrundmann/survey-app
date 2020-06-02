import 'package:flutter/foundation.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/repositories/questions_repository.dart';

class ExportAllQuestionsUseCase extends UseCase {
  final QuestionsRepository repository;

  ExportAllQuestionsUseCase({
    @required this.repository,
  });

  @override
  Future<Either<Failure, Success>> call(params) {
    return repository.exportAll();
  }
}
