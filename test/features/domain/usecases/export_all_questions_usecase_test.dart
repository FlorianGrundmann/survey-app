import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/repositories/questions_repository.dart';
import 'package:survey_app/features/survey/domain/usecases/export_all_questions_usecase.dart';

class MockDataRepository extends Mock implements QuestionsRepository {}

void main() {
  MockDataRepository mockRepo;
  ExportAllQuestionsUseCase usecase;

  setUp(() {
    mockRepo = MockDataRepository();
    usecase = ExportAllQuestionsUseCase(repository: mockRepo);
  });

  test('Calls QuestionDataRepository.exportAll when called', () async {
    //arrange
    //act
    usecase(NoParams());
    //assert
    verify(mockRepo.exportAll());
  });

  test('Returns result form repository.', () async {
    //arrange
    final Either<Failure, Success> tRepoResult = Right(Success());
    when(mockRepo.exportAll()).thenAnswer((_) async => tRepoResult);
    //act
    final result = await usecase(NoParams());
    //assert
    expect(result, tRepoResult);
  });
}
