import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/features/survey/domain/entities/question.dart';
import 'package:survey_app/features/survey/domain/usecases/start_survey_usecase.dart';
import 'package:survey_app/features/survey/presentation/bloc/survey_bloc.dart';
import 'package:mockito/mockito.dart';

class MockStartSurveyUseCase extends Mock implements StartSurveyUsecase {}

void main() {
  SurveyBloc bloc;
  MockStartSurveyUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockStartSurveyUseCase();
    bloc = SurveyBloc(startSurveyUsecase: mockUseCase);
  });

  group('Initial state.', () {
    test('Initial state is GreetingState.', () async {
      //assert
      expect(bloc.initialState, GreetingState());
    });
  });

  group('StartSurveyEvent', () {
    List<Question> tQuestions = [
      Question('first question'),
      Question('second question'),
    ];

    test('Calls repository to load all questions.', () async {
      //arrange
      when(mockUseCase(any))
          .thenAnswer((realInvocation) async => Right(tQuestions));
      //act
      bloc.add(StartSurveyEvent());
      await untilCalled(mockUseCase(any));
      //assert
      verify(mockUseCase(any));
    });

    test('Emits states [Greeting, Loading, Question] with first question.',
        () async {
      //arrange
      when(mockUseCase(any))
          .thenAnswer((realInvocation) async => Right(tQuestions));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(tQuestions[0]),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(StartSurveyEvent());
    });
  });
}
