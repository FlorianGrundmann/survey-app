import '../../domain/entities/question.dart';

class QuestionMapper {
  Future<String> mapToCsv(List<Question> questions) async {
    String header = 'question_id; question';
    String entries = '';
    for (int i = 0; i < questions.length; i++) {
      entries += '\n'
          '${questions[i].id}; '
          '${questions[i].questionText}';
    }

    return header + entries;
  }
}
