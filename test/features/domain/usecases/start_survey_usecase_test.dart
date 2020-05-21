import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/entities/question.dart';
import 'package:survey_app/features/survey/domain/repositories/questions_repository.dart';
import 'package:survey_app/features/survey/domain/usecases/start_survey_usecase.dart';

class MockQuestionsRepository extends Mock implements QuestionsRepository {}

void main() {
  UseCase usecase;
  MockQuestionsRepository mockRepository;

  setUp(() {
    mockRepository = MockQuestionsRepository();
    usecase = StartSurveyUseCase(repository: mockRepository);
  });

  final Either<Failure, List<Question>> tRepositoryResult =
      Right([Question('test Question')]);

  test('Returns result from repository.', () async {
    //arrange

    when(mockRepository.loadAllQuestions())
        .thenAnswer((_) async => tRepositoryResult);
    //act
    final result = await usecase(NoParams);
    //assert
    expect(result, tRepositoryResult);
    verify(mockRepository.loadAllQuestions()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
