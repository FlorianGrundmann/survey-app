import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:survey_app/features/survey/data/datasources/local_survey_data_source.dart';
import 'package:survey_app/features/survey/data/model/response_data.dart';

class SqliteDataSource implements LocalSurveyDataSource {
  Future<Database> _database;

  SqliteDataSource() {
    _database = _openDatabase();
  }

  @override
  Future<void> saveSurveyData(List<ResponseData> surveyData) async {
    Database db = await _database;
    for (ResponseData response in surveyData) {
      await db.insert(
        'responses',
        toMap(response),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<ResponseData>> loadAllResponses() async {
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('responses');
    return _toResponseData(maps);
  }

  Future<Database> _openDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'survey_app.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE responses(response_id TEXT PRIMARY KEY, response TEXT, responder_id TEXT, question_id TEXT);",
        );
      },
      version: 1,
    );
  }

  Map<String, String> toMap(ResponseData response) {
    return {
      'response_id': response.responseId,
      'response': response.response,
      'responder_id': response.responderId,
      'question_id': response.questionId,
    };
  }

  List<ResponseData> _toResponseData(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return ResponseData(
        questionId: maps[i]['question_id'],
        responderId: maps[i]['responder_id'],
        response: maps[i]['response'],
        responseId: maps[i]['response_id'],
      );
    });
  }
}
