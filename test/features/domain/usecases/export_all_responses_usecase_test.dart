import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/core/usecases/usecase.dart';
import 'package:survey_app/features/survey/domain/repositories/response_data_repository.dart';
import 'package:survey_app/features/survey/domain/usecases/export_all_responses_usecase.dart';

class MockDataRepository extends Mock implements ResponseDataRepository {}

void main() {
  MockDataRepository mockRepo;
  ExportAllResponsesUsecase usecase;

  setUp(() {
    mockRepo = MockDataRepository();
    usecase = ExportAllResponsesUsecase(repository: mockRepo);
  });

  test('Calls ResponseDataRepository.exportAll when called', () async {
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
