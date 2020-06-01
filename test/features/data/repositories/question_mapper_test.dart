import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/features/survey/data/repositories/question_mapper.dart';
import 'package:survey_app/features/survey/domain/entities/question.dart';

void main() {
  QuestionMapper mapper;
  String expectedHeader = 'question_id; question';

  setUp(() {
    mapper = QuestionMapper();
  });

  group('mapToCSV with empty data', () {
    List<Question> tQuestions = [];
    test(
        'Returns a string with semicollon seperated header when given empty list',
        () async {
      //arrange
      //act
      String result = await mapper.mapToCsv(tQuestions);
      //assert
      expect(result, '$expectedHeader');
    });
  });

  group('mapToCSV with one data entry', () {
    String tQuestionId = '1111';
    String tQuestionText = 'qtext';
    List<Question> tResponseData = [
      Question(
        questionText: tQuestionText,
        id: tQuestionId,
        responseOptions: [],
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
        '$expectedHeader\n'
        '$tQuestionId; $tQuestionText',
      );
    });
  });

  group('mapToCSV with two data entry', () {
    String tQuestionId1 = '1111';
    String tQuestionId2 = '2222';
    String tQuestionText1 = 'qt1';
    String tQuestionText2 = 'qt2';
    List<Question> tResponseData = [
      Question(
        questionText: tQuestionText1,
        id: tQuestionId1,
        responseOptions: [],
      ),
      Question(
        questionText: tQuestionText2,
        id: tQuestionId2,
        responseOptions: [],
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
        '$expectedHeader\n'
        '$tQuestionId1; $tQuestionText1\n'
        '$tQuestionId2; $tQuestionText2',
      );
    });
  });
}
