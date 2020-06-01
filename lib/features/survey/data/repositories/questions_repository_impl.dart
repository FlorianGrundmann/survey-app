import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/questions_repository.dart';
import '../datasources/local_question_data_source.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final LocalQuestionDataSource localDataSource;

  QuestionsRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Question>>> loadAllQuestions() async {
    try {
      List<Question> result = await localDataSource.loadAllQuestions();
      return Right(result);
    } catch (Exception) {
      return Left(LocalDataSourceFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> exportAll() {
    // TODO: implement exportAll
    throw UnimplementedError();
  }
}
