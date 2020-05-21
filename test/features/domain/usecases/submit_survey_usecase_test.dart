import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/entities/answer.dart';
import 'package:survey_app/features/survey/domain/repositories/survey_data_repository.dart';
import 'package:survey_app/features/survey/domain/usecases/submit_survey_usecase.dart';

class MockSurveyDataRepository extends Mock implements SurveyDataRepository {}

void main() {
  UseCase useCase;
  MockSurveyDataRepository mockRepository;

  setUp(() {
    mockRepository = MockSurveyDataRepository();
    useCase = SubmitSurveyUseCase(mockRepository);
  });

  final Either<Failure, Success> tRepositoryResult = Right(Success());
  final Answer tAnswer = Answer(0);
  test('Returns repository result', () async {
    //arrange
    when(mockRepository.saveSurveyData(any))
        .thenAnswer((_) async => tRepositoryResult);
    //act
    final result = await useCase(tAnswer);
    //assert
    verify(mockRepository.saveSurveyData(tAnswer)).called(1);
    verifyNoMoreInteractions(mockRepository);
    expect(result, tRepositoryResult);
  });
}
