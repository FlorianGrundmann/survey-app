import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/core/error/exceptions.dart';
import 'package:survey_app/features/survey/data/model/response_data.dart';
import 'package:survey_app/features/survey/data/repositories/response_mapper.dart';
import 'package:survey_app/features/survey/domain/entities/rating_question.dart';
import 'package:survey_app/features/survey/domain/entities/response.dart';
import 'package:survey_app/features/survey/domain/entities/question.dart';
import 'package:survey_app/features/survey/domain/entities/response_option.dart';

class UnknownType {}

void main() {
  ResponseMapper mapper;

  setUp(() {
    mapper = ResponseMapper();
  });

  group('mapToResponseData with FourPointOption', () {
    final ResponseOption tStrongNoOption =
        ResponseOption(FourPointRatings.StrongNo);
    final ResponseOption tStrongYesOption =
        ResponseOption(FourPointRatings.StrongYes);
    final ResponseOption tNoOption = ResponseOption(FourPointRatings.No);
    final ResponseOption tYesOption = ResponseOption(FourPointRatings.Yes);
    final List<ResponseOption> tResponseOptions = [
      tStrongNoOption,
      tNoOption,
      tYesOption,
      tStrongYesOption,
    ];
    final tId = 'testId';
    final Question tQuestion = Question(
      questionText: 'testText',
      id: tId,
      responseOptions: tResponseOptions,
    );
    final List<Response> tResponses = [
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tStrongNoOption,
        responderId: 'testResponderId',
      ),
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tNoOption,
        responderId: 'testResponderId',
      ),
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tYesOption,
        responderId: 'testResponderId',
      ),
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tStrongYesOption,
        responderId: 'testResponderId',
      ),
    ];
    test('Result has same length as input parameter', () async {
      //arrange
      //act
      List<ResponseData> result = mapper.mapToResponseData(tResponses);
      //assert
      expect(result.length, tResponses.length);
    });

    test('Result question id is id from input', () async {
      //arrange
      //act
      List<ResponseData> result = mapper.mapToResponseData(tResponses);
      //assert
      expect(result[0].questionId, tId);
      expect(result[1].questionId, tId);
      expect(result[2].questionId, tId);
      expect(result[3].questionId, tId);
    });

    test('Result has unique id.', () async {
      //arrange
      //act
      List<ResponseData> result = mapper.mapToResponseData(tResponses);
      //assert
      expect(result[0].responseId, isNotNull);
      expect(result[0].responseId, isNotEmpty);
      expect(result[0].responseId, isNot(result[1].responseId));
    });

    test('Maps to FourPointRating to correct int.', () async {
      //arrange
      //act
      List<ResponseData> result = mapper.mapToResponseData(tResponses);
      //assert
      expect(result[0].response, '0');
      expect(result[1].response, '1');
      expect(result[2].response, '2');
      expect(result[3].response, '3');
    });
  });

  group('mapToResponseData with Unknown value type', () {
    final tId = 'testId';
    final Question tQuestion = Question(
      questionText: 'testText',
      id: tId,
      responseOptions: [ResponseOption(UnknownType())],
    );
    final List<Response> tResponses = [
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: ResponseOption(UnknownType()),
        responderId: 'testResponderId',
      ),
    ];

    test('Expect throws UnknownResponseOptionType', () async {
      //arrange
      //act
      //assert
      expect(() => mapper.mapToResponseData(tResponses),
          throwsA(isA<UnknownResponseOptionType>()));
    });
  });

  group('mapToCSV with empty data', () {
    List<ResponseData> tResponseData = [];
    test(
        'Returns a string with semicollon seperated header when given empty list',
        () async {
      //arrange
      //act
      String result = await mapper.mapToCsv(tResponseData);
      //assert
      expect(result, 'response_id; response; question_id; responder_id');
    });
  });

  group('mapToCSV with one data entry', () {
    String tQuestionId = '1111';
    String tResponderId = '2222';
    String tResponse = '0';
    String tResponseId = '3333';
    List<ResponseData> tResponseData = [
      ResponseData(
        questionId: tQuestionId,
        responderId: tResponderId,
        response: tResponse,
        responseId: tResponseId,
      )
    ];
    test(
        'Returns a string with semicollon seperated header when given empty list',
        () async {
      //arrange
      //act
      String result = await mapper.mapToCsv(tResponseData);
      //assert
      expect(
        result,
        'response_id; response; question_id; responder_id\n'
        '$tResponseId; $tResponse; $tQuestionId; $tResponderId',
      );
    });
  });

  group('mapToCSV with two data entry', () {
    String tQuestionId1 = '1111';
    String tResponderId1 = '2222';
    String tResponse1 = '0';
    String tResponseId1 = '3333';
    String tQuestionId2 = '1111';
    String tResponderId2 = '4444';
    String tResponse2 = '0';
    String tResponseId2 = '5555';
    List<ResponseData> tResponseData = [
      ResponseData(
        questionId: tQuestionId1,
        responderId: tResponderId1,
        response: tResponse1,
        responseId: tResponseId1,
      ),
      ResponseData(
        questionId: tQuestionId2,
        responderId: tResponderId2,
        response: tResponse2,
        responseId: tResponseId2,
      ),
    ];
    test(
        'Returns a string with semicollon seperated header when given empty list',
        () async {
      //arrange
      //act
      String result = await mapper.mapToCsv(tResponseData);
      //assert
      expect(
        result,
        'response_id; response; question_id; responder_id\n'
        '$tResponseId1; $tResponse1; $tQuestionId1; $tResponderId1\n'
        '$tResponseId2; $tResponse2; $tQuestionId2; $tResponderId2',
      );
    });
  });
}
