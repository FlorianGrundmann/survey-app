import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:survey_app/features/survey/data/model/response_data.dart';
import 'package:survey_app/features/survey/data/repositories/response_mapper.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/response.dart';
import '../../domain/repositories/response_data_repository.dart';
import '../datasources/local_survey_data_source.dart';

class SurveyDataRepositoryImpl implements ResponseDataRepository {
  final LocalSurveyDataSource localDataSource;
  final ResponseMapper mapper;

  SurveyDataRepositoryImpl({
    @required this.localDataSource,
    @required this.mapper,
  });

  @override
  Future<Either<Failure, Success>> saveResponse(
      List<Response> responses) async {
    try {
      List<ResponseData> responseData = mapper.mapToResponseData(responses);
      localDataSource.saveSurveyData(responseData);
      return Right(Success());
    } on LocalDataSourceException {
      return Left(LocalDataSourceFailure());
    } on UnknownResponseOptionType {
      return Left(MappingFailure());
    } on MappingFailed {
      return Left(MappingFailure());
    } on Exception {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Success>> exportAll() {
    // TODO: implement exportAll
    throw UnimplementedError();
  }
}
