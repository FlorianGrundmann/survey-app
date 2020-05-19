import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/data/datasources/local_data_source.dart';
import 'package:survey_app/features/survey/data/model/question_model.dart';
import 'package:survey_app/features/survey/data/repositories/questions_repository_impl.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  MockLocalDataSource mockLocalDataSource;
  QuestionsRepositoryImpl repo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repo = QuestionsRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  List<QuestionModel> tQuestions = [
    QuestionModel('test question'),
  ];
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
}
