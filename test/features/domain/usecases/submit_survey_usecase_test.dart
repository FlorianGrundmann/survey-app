import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/entities/response_option.dart';
import 'package:survey_app/features/survey/domain/entities/response.dart';
import 'package:survey_app/features/survey/domain/repositories/response_data_repository.dart';
import 'package:survey_app/features/survey/domain/usecases/submit_survey_usecase.dart';

class MockSurveyDataRepository extends Mock implements ResponseDataRepository {}

void main() {
  UseCase useCase;
  MockSurveyDataRepository mockRepository;

  setUp(() {
    mockRepository = MockSurveyDataRepository();
    useCase = SubmitResponseUseCase(repository: mockRepository);
  });

  final Either<Failure, Success> tRepositoryResult = Right(Success());
  final List<Response> tResponse = [
    Response(
      questionRespondedTo: null,
      selectedResponse: ResponseOption(0),
    ),
  ];
  test('Returns repository result', () async {
    //arrange
    when(mockRepository.saveResponse(any))
        .thenAnswer((_) async => tRepositoryResult);
    //act
    final result = await useCase(tResponse);
    //assert
    verify(mockRepository.saveResponse(tResponse)).called(1);
    verifyNoMoreInteractions(mockRepository);
    expect(result, tRepositoryResult);
  });
}
