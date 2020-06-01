import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/core/error/failures.dart';
import 'package:survey_app/features/survey/domain/entities/response_option.dart';
import 'package:survey_app/features/survey/domain/entities/response.dart';
import 'package:survey_app/features/survey/domain/entities/question.dart';
import 'package:survey_app/features/survey/domain/usecases/export_all_responses_usecase.dart';
import 'package:survey_app/features/survey/domain/usecases/start_survey_usecase.dart';
import 'package:survey_app/features/survey/domain/usecases/submit_survey_usecase.dart';
import 'package:survey_app/features/survey/presentation/bloc/survey_bloc.dart';
import 'package:mockito/mockito.dart';

class MockStartSurveyUseCase extends Mock implements StartSurveyUseCase {}

class MockSubmitSurveyUseCase extends Mock implements SubmitResponseUseCase {}

class MockExportAllResponsesUseCase extends Mock
    implements ExportAllResponsesUsecase {}

void main() {
  SurveyBloc bloc;
  MockStartSurveyUseCase mockStartUseCase;
  MockSubmitSurveyUseCase mockSubmitUseCase;
  MockExportAllResponsesUseCase mockExportUseCase;

  List<Question> tSurveyElements = [
    Question(
        questionText: 'first question', responseOptions: [ResponseOption(0)]),
    Question(
        questionText: 'second question', responseOptions: [ResponseOption(0)]),
    Question(
        questionText: 'third question', responseOptions: [ResponseOption(0)]),
  ];

  setUp(() {
    mockStartUseCase = MockStartSurveyUseCase();
    mockSubmitUseCase = MockSubmitSurveyUseCase();
    mockExportUseCase = MockExportAllResponsesUseCase();
    bloc = SurveyBloc(
      startSurveyUseCase: mockStartUseCase,
      submitResponseUseCase: mockSubmitUseCase,
      exportResponsesUseCase: mockExportUseCase,
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
          question: tSurveyElements[0],
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
          question: tSurveyElements[0],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 1,
          question: tSurveyElements[1],
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
          question: tSurveyElements[0],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 1,
          question: tSurveyElements[1],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 2,
          question: tSurveyElements[2],
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
    Question tSurveyElement = Question(
        questionText: 'first question', responseOptions: [ResponseOption(0)]);
    List<Response> tResponse = [
      Response(
        questionRespondedTo: tSurveyElement,
        selectedResponse: ResponseOption(0),
        responderId: 'testResponderId',
      ),
    ];

    test('Calls SubmitAnswersUseCase with survey elements', () async {
      //arrange
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right([tSurveyElement]));
      //act
      bloc.add(StartSurveyEvent());
      bloc.add(SubmitAnswersEvent());
      await untilCalled(mockSubmitUseCase(any));
      //assert
      verify(mockSubmitUseCase(any));
    });

    test(
        'Emits States [Greeting, Loading, Question, Loading, ThankYou] going through all relevant survey events.',
        () async {
      //arrange
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right([tSurveyElement]));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tResponse.length,
          questionIndex: 0,
          question: tSurveyElement,
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
          question: tSurveyElements[0],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 1,
          question: tSurveyElements[1],
        ),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          question: tSurveyElements[0],
        ),
      ];
      expectLater(bloc, emitsInAnyOrder(expected));

      //act
      bloc.add(StartSurveyEvent());
      bloc.add(NextQuestionEvent());
      bloc.add(PreviousQuestionEvent());
    });
  });

  group('RestartEvent', () {
    test('Emits Greeting state after restart.', () async {
      when(mockStartUseCase(any))
          .thenAnswer((_) async => Right(tSurveyElements));
      //assert later
      final expected = [
        GreetingState(),
        LoadingState(),
        QuestionState(
          numberTotalQuestions: tSurveyElements.length,
          questionIndex: 0,
          question: tSurveyElements[0],
        ),
        GreetingState(),
      ];
      expectLater(bloc, emitsInAnyOrder(expected));

      //act
      bloc.add(StartSurveyEvent());
      bloc.add(RestartEvent());
    });
  });

  group('OpenAdminMenuEvent', () {
    test('Emits AdminMenuState after firering.', () async {
      //assert later
      final expected = [
        GreetingState(),
        AdminMenuState(),
      ];
      expectLater(bloc, emitsInAnyOrder(expected));

      //act
      bloc.add(OpenAdminMenuEvent());
    });
  });

  group('ExportResponsesEvent', () {
    test('Emits [..., Exporting, AdminMenuState] after firering.', () async {
      //arrange
      final expected = [
        GreetingState(),
        ExportingState(),
        AdminMenuState(),
      ];
      //act
      expectLater(bloc, emitsInAnyOrder(expected));
      //assert
      bloc.add(ExportResponsesEvent());
    });

    test('Calls use case after firering.', () async {
      //arrange
      //act
      bloc.add(ExportResponsesEvent());
      await untilCalled(mockExportUseCase(any));
      //assert
      verify(mockExportUseCase.call(any));
    });
  });
}
