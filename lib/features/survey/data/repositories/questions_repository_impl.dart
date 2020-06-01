import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/questions_repository.dart';
import '../datasources/file_data_source.dart';
import '../datasources/local_question_data_source.dart';
import 'question_mapper.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final LocalQuestionDataSource localDataSource;
  final FileDataSource fileDataSource;
  final QuestionMapper mapper;

  QuestionsRepositoryImpl({
    @required this.fileDataSource,
    @required this.localDataSource,
    @required this.mapper,
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
  Future<Either<Failure, Success>> exportAll() async {
    List<Question> questions = await localDataSource.loadAllQuestions();
    String csvString = await mapper.mapToCsv(questions);
    await fileDataSource.exportAsFile(csvString, 'questions.csv');
    return Right(Success());
  }
}
