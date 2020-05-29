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
      ),
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tNoOption,
      ),
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tYesOption,
      ),
      Response(
        questionRespondedTo: tQuestion,
        selectedResponse: tStrongYesOption,
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
      expect(result[0].response, 0);
      expect(result[1].response, 1);
      expect(result[2].response, 2);
      expect(result[3].response, 3);
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
}
