import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/survey_element.dart';
import '../../domain/repositories/questions_repository.dart';
import '../datasources/local_question_data_source.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final LocalQuestionDataSource localDataSource;

  QuestionsRepositoryImpl({
    @required this.localDataSource,
  });

  ///Loads all questions from the given data source.
  ///Returns [LocalDataSourceFailure] when an unknown exception happens during loading.
  @override
  Future<Either<Failure, List<SurveyElement>>> loadAllQuestions() async {
    try {
      List<SurveyElement> result = await localDataSource.loadAllQuestions();
      return Right(result);
    } catch (Exception) {
      return Left(LocalDataSourceFailure());
    }
  }
}
