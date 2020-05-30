import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/exceptions.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/data/datasources/local_survey_data_source.dart';
import 'package:survey_app/features/survey/data/model/response_data.dart';
import 'package:survey_app/features/survey/data/repositories/response_mapper.dart';
import 'package:survey_app/features/survey/data/repositories/responses_repository_impl.dart';
import 'package:survey_app/features/survey/domain/entities/response.dart';

class MockLocalSurveyDataSource extends Mock implements LocalSurveyDataSource {}

class MockResponseMapper extends Mock implements ResponseMapper {}

void main() {
  MockResponseMapper mockMapper;
  MockLocalSurveyDataSource mockDataSource;
  ResponsesRepositoryImpl repository;

  setUp(() {
    mockMapper = MockResponseMapper();
    mockDataSource = MockLocalSurveyDataSource();
    repository = ResponsesRepositoryImpl(
      localDataSource: mockDataSource,
      mapper: mockMapper,
    );
  });

  group('saveSurveyData', () {
    final Response tResponse = Response(
      questionRespondedTo: null,
      selectedResponse: null,
      responderId: 'testResponderId',
    );
    final List<Response> tsurveyElements = [
      tResponse,
    ];
    final List<ResponseData> tResponseData = [];

    test('Returns failure when ResponseOption type is unknown.', () async {
      //arrange
      when(mockMapper.mapToResponseData(any))
          .thenThrow(UnknownResponseOptionType());
      //act
      final result = await repository.saveResponse(tsurveyElements);
      //assert
      expect(result, Left(MappingFailure()));
    });
    test('Calls mapToResponseData on ResponseMapper', () async {
      //arrange
      //act
      repository.saveResponse(tsurveyElements);
      //assert
      verify(mockMapper.mapToResponseData(tsurveyElements));
    });

    test('Calls saveSurveyData on local data source.', () async {
      //arrange
      when(mockMapper.mapToResponseData(tsurveyElements))
          .thenReturn(tResponseData);
      //act
      repository.saveResponse(tsurveyElements);
      //assert
      verify(mockDataSource.saveSurveyData(tResponseData));
    });

    test('Returns Success when no exception happens.', () async {
      //arrange
      //act
      final result = await repository.saveResponse(tsurveyElements);
      //assert
      expect(result, Right(Success()));
    });

    test('Returns Failure when exception happens.', () async {
      //arrange
      when(mockDataSource.saveSurveyData(any))
          .thenThrow(LocalDataSourceException());
      //act
      final result = await repository.saveResponse(tsurveyElements);
      //assert
      expect(result, Left(LocalDataSourceFailure()));
    });
  });
}
