import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/questions_repository.dart';
import '../datasources/local_data_source.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final LocalDataSource localDataSource;

  QuestionsRepositoryImpl({this.localDataSource});

  @override
  Future<Either<Failure, List<Question>>> loadAllQuestions() async {
    try {
      List<Question> result = await localDataSource.loadAllQuestions();
      return Right(result);
    } catch (Exception) {
      return Left(LocalDataSourceFailure());
    }
  }
}
