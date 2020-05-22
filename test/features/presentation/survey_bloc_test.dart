import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/domain/entities/survey_element.dart';
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

  List<SurveyElement> tSurveyElements = [
    SurveyElement(question: Question('first question'), answer: Answer()),
    SurveyElement(question: Question('second question'), answer: Answer()),
    SurveyElement(question: Question('third question'), answer: Answer()),
  ];

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
    test('Calls repository to load all questions.', () async {
      //arrange
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
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
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          surveyElement: tSurveyElements[0],
        ),
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
    test(
        'Emits states [Greeting, Loading, Question, Question] with first and second question when StartSurveyEvent and NextQuestionEvent is added.',
        () async {
      //arrange
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          surveyElement: tSurveyElements[0],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 1,
          surveyElement: tSurveyElements[1],
        ),
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
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          surveyElement: tSurveyElements[0],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 1,
          surveyElement: tSurveyElements[1],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 2,
          surveyElement: tSurveyElements[2],
        ),
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
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
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
    List<SurveyElement> tSurveyElements = [
      SurveyElement(question: Question('first question'), answer: Answer()),
    ];

    test('Calls SubmitAnswersUseCase with survey elements', () async {
      //arrange
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //act
      bloc.add(StartSurveyEvent());
      bloc.add(SubmitAnswersEvent());
      await untilCalled(mockSubmitUseCase(any));
      //assert
      verify(mockSubmitUseCase(tSurveyElements));
    });

    test(
        'Emits States [Greeting, Loading, Question, Loading, ThankYou] going through all relevant survey events.',
        () async {
      //arrange
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          surveyElement: tSurveyElements[0],
        ),
        LoadingState(),
        ThankYouState(),
      ];
      expectLater(bloc, emitsInAnyOrder(expected));

      //act
      bloc.add(StartSurveyEvent());
      bloc.add(SubmitAnswersEvent());
    });
  });

  group('PreviousQuestionEvent', () {
    test('Emits previous question state again when firering event.', () async {
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          surveyElement: tSurveyElements[0],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 1,
          surveyElement: tSurveyElements[1],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          surveyElement: tSurveyElements[0],
        ),
      ];
      expectLater(bloc, emitsInAnyOrder(expected));

      //act
      bloc.add(StartSurveyEvent());
      bloc.add(NextQuestionEvent());
      bloc.add(PreviousQuestionEvent());
    });
  });
}
