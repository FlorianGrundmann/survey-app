import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/domain/entities/answer.dart';
import 'package:survey_app/features/survey/domain/entities/question.dart';
import 'package:survey_app/features/survey/domain/usecases/start_survey_usecase.dart';
import 'package:survey_app/features/survey/domain/usecases/submit_survey_usecase.dart';
import 'package:survey_app/features/survey/presentation/bloc/survey_bloc.dart';
import 'package:mockito/mockito.dart';

class MockStartSurveyUseCase extends Mock implements StartSurveyUseCase {}

class MockSubmitSurveyUseCase extends Mock implements SubmitSurveyUseCase {}

void main() {
  SurveyBloc bloc;
  MockStartSurveyUseCase mockStartUseCase;
  MockSubmitSurveyUseCase mockSubmitUseCase;

  setUp(() {
    mockStartUseCase = MockStartSurveyUseCase();
    mockSubmitUseCase = MockSubmitSurveyUseCase();
    bloc = SurveyBloc(
      startSurveyUseCase: mockStartUseCase,
      submitSurveyUseCase: mockSubmitUseCase,
    );
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
      Question('third question'),
    ];

    test('Calls repository to load all questions.', () async {
      //arrange
      when(mockStartUseCase(any)).thenAnswer((_) async => Right(tQuestions));
      //act
      bloc.add(StartSurveyEvent());
      await untilCalled(mockStartUseCase(any));
      //assert
      verify(mockStartUseCase(any));
    });

    test(
        'Emits states [Greeting, Loading, Question] with first question when StartSurveyEverent is added.',
        () async {
      //arrange
      when(mockStartUseCase(any)).thenAnswer((_) async => Right(tQuestions));
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

    test(
        'Emits states [Greeting, Loading, Failure] when Failure is returend by use case.',
        () async {
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Left(LocalDataSourceFailure()));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        FailureState(),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(StartSurveyEvent());
    });
  });

  group('NextQuestionEvent', () {
    List<Question> tQuestions = [
      Question('first question'),
      Question('second question'),
      Question('third question'),
    ];
    test(
        'Emits states [Greeting, Loading, Question, Question] with first and second question when StartSurveyEvent and NextQuestionEvent is added.',
        () async {
      //arrange
      when(mockStartUseCase(any)).thenAnswer((_) async => Right(tQuestions));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(tQuestions[0]),
        QuestionState(tQuestions[1]),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(StartSurveyEvent());
      bloc.add(NextQuestionEvent());
    });

    test(
        'Emits states [Greeting, Loading, Question, Question, Question] when next Question is called twice.',
        () async {
      //arrange
      when(mockStartUseCase(any)).thenAnswer((_) async => Right(tQuestions));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(tQuestions[0]),
        QuestionState(tQuestions[1]),
        QuestionState(tQuestions[2]),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(StartSurveyEvent());
      bloc.add(NextQuestionEvent());
      bloc.add(NextQuestionEvent());
    });

    test(
        'Emits states [Greeting, Failure] when NextQuestionEvent is fired without StartSurveyEvent.',
        () async {
      //arrange
      when(mockStartUseCase(any)).thenAnswer((_) async => Right(tQuestions));
      //assert later
      final expected = [
        GreetingState(),
        FailureState(),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(NextQuestionEvent());
    });
  });

  group('SubmitAnswersEvent', () {
    List<Question> tQuestions = [
      Question('first question'),
    ];

    List<Answer> tAnswers = [
      Answer(2),
    ];

    test('Calls SubmitAnswersUseCase', () async {
      //arrange
      //act
      bloc.add(SubmitAnswersEvent());
      await untilCalled(mockSubmitUseCase(any));
      //assert
      verify(mockSubmitUseCase(any));
    });

    test(
        'Emits States [Greeting, Loading, Question, Loading, ThankYou] going through all relevant survey events.',
        () async {
      //arrange
      when(mockStartUseCase(any)).thenAnswer((_) async => Right(tQuestions));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(tQuestions[0]),
        LoadingState(),
        ThankYouState(),
      ];
      expectLater(bloc, emitsInAnyOrder(expected));

      //act
      bloc.add(StartSurveyEvent());
      bloc.add(SubmitAnswersEvent());
    });
  });
}
