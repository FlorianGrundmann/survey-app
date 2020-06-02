import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:survey_app/features/survey/data/datasources/file_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/response.dart';
import '../../domain/repositories/response_data_repository.dart';
import '../datasources/local_survey_data_source.dart';
import '../model/response_data.dart';
import 'response_mapper.dart';

class ResponsesRepositoryImpl implements ResponseDataRepository {
  final LocalSurveyDataSource localDataSource;
  final FileDataSource fileDataSource;
  final ResponseMapper mapper;

  ResponsesRepositoryImpl({
    @required this.localDataSource,
    @required this.fileDataSource,
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
  Future<Either<Failure, Success>> exportAll() async {
    List<ResponseData> responses = await localDataSource.loadAllResponses();
    String csvResponses = await mapper.mapToCsv(responses);
    await fileDataSource.exportAsFile(csvResponses, 'responses.csv');
    return Right(Success());
  }
}
