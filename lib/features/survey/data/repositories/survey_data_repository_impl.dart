import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/response.dart';
import '../../domain/repositories/response_data_repository.dart';
import '../datasources/local_survey_data_source.dart';

class SurveyDataRepositoryImpl implements ResponseDataRepository {
  final LocalSurveyDataSource localDataSource;

  SurveyDataRepositoryImpl({this.localDataSource});

  @override
  Future<Either<Failure, Success>> saveResponse(List<Response> survey) async {
    try {
      localDataSource.saveSurveyData();
      return Right(Success());
    } on LocalDataSourceException {
      return Left(LocalDataSourceFailure());
    }
  }
}
