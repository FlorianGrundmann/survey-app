import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/exceptions.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/data/datasources/local_survey_data_source.dart';
import 'package:survey_app/features/survey/data/repositories/survey_data_repository_impl.dart';
import 'package:survey_app/features/survey/domain/entities/survey_element.dart';

class MockLocalSurveyDataSource extends Mock implements LocalSurveyDataSource {}

void main() {
  MockLocalSurveyDataSource mockDataSource;
  SurveyDataRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockLocalSurveyDataSource();
    repository = SurveyDataRepositoryImpl(localDataSource: mockDataSource);
  });

  group('saveSurveyData', () {
    final List<SurveyElement> tsurveyElements = [];

    test('Calls saveSurveyData on local data source.', () async {
      //arrange
      //act
      repository.saveSurveyData(tsurveyElements);
      //assert
      verify(mockDataSource.saveSurveyData());
    });

    test('Returns Success when no exception happens.', () async {
      //arrange
      //act
      final result = await repository.saveSurveyData(tsurveyElements);
      //assert
      expect(result, Right(Success()));
    });

    test('Returns Failure when exception happens.', () async {
      //arrange
      when(mockDataSource.saveSurveyData()).thenThrow(LocalDataBaseException());
      //act
      final result = await repository.saveSurveyData(tsurveyElements);
      //assert
      expect(result, Left(LocalDataSourceFailure()));
    });
  });
}
