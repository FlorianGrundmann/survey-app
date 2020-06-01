import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/data/datasources/file_data_source.dart';
import 'package:survey_app/features/survey/data/datasources/local_question_data_source.dart';
import 'package:survey_app/features/survey/data/repositories/question_mapper.dart';
import 'package:survey_app/features/survey/data/repositories/questions_repository_impl.dart';
import 'package:survey_app/features/survey/domain/entities/rating_question.dart';

class MockLocalDataSource extends Mock implements LocalQuestionDataSource {}

class MockQuestionMapper extends Mock implements QuestionMapper {}

class MockFileDataSource extends Mock implements FileDataSource {}

void main() {
  MockLocalDataSource mockLocalDataSource;
  QuestionsRepositoryImpl repo;
  MockQuestionMapper mockMapper;
  MockFileDataSource mockFileDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockMapper = MockQuestionMapper();
    mockFileDataSource = MockFileDataSource();
    repo = QuestionsRepositoryImpl(
      localDataSource: mockLocalDataSource,
      mapper: mockMapper,
      fileDataSource: mockFileDataSource,
    );
  });

  List<RatingQuestion> tQuestions = [
    RatingQuestion('test question', 'testId'),
  ];

  group('loadAllQuestions', () {
    test('Returns questions from local data source', () async {
      //arrange
      when(mockLocalDataSource.loadAllQuestions())
          .thenAnswer((_) async => tQuestions);
      //act
      final result = await repo.loadAllQuestions();
      //assert
      expect(result, Right(tQuestions));
    });

    test(
        'Returns LocalDataSourceFailure when local data source throws exception.',
        () async {
      //arrange
      when(mockLocalDataSource.loadAllQuestions()).thenThrow(Exception());
      //act
      final result = await repo.loadAllQuestions();
      //assert
      expect(result, Left(LocalDataSourceFailure()));
    });
  });

  group('exportAll', () {
    String tString = 'random';

    test('Calls loadAll from local datasource', () async {
      //arrange
      //act
      repo.exportAll();
      //assert
      verify(mockLocalDataSource.loadAllQuestions());
    });

    test('Calls mapper mapToCsv', () async {
      //arrange
      when(mockLocalDataSource.loadAllQuestions())
          .thenAnswer((_) async => tQuestions);
      //act
      await repo.exportAll();
      //assert
      verify(mockMapper.mapToCsv(tQuestions));
    });

    test('Calls export as file', () async {
      //arrange
      when(mockLocalDataSource.loadAllQuestions())
          .thenAnswer((_) async => tQuestions);
      when(mockMapper.mapToCsv(tQuestions)).thenAnswer((_) async => tString);
      //act
      await repo.exportAll();
      //assert
      verify(mockFileDataSource.exportAsFile(tString, any));
    });

    test('Returns Success when no exception happens.', () async {
      //arrange
      //act
      final result = await repo.exportAll();
      //assert
      expect(result, Right(Success()));
    });
  });
}
