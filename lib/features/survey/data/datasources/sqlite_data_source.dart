import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:survey_app/features/survey/data/datasources/local_survey_data_source.dart';
import 'package:survey_app/features/survey/data/model/response_data.dart';

class SqliteDataSource implements LocalSurveyDataSource {
  Future<Database> _database;

  SqliteDataSource([Future<Database> database]) {
    _database = database ?? _openDatabase();
  }

  @override
  Future<void> saveSurveyData(List<ResponseData> surveyData) async {
    Database db = await _database;
    for (ResponseData response in surveyData) {
      await db.insert(
        'responses',
        _toMap(response),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<List<ResponseData>> loadAllResponses() async {
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('responses');
    return _toResponseData(maps);
  }

  Future<Database> _openDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'survey_app.db'),
      onCreate: _onCreate,
      onUpgrade: _onUpdate,
      version: 9,
    );
  }

  Future<void> _onUpdate(
    Database db,
    int oldVersion,
    int currentVersion,
  ) async {
    await db.execute('DROP TABLE IF EXISTS questions; ');
    return _onCreate(db, currentVersion);
  }

  Future<void> _onCreate(Database db, int version) async {
    return db.execute(
        'CREATE TABLE responses (response_id TEXT PRIMARY KEY, response TEXT, responder_id TEXT, question_id TEXT);');
  }

  Map<String, String> _toMap(ResponseData response) {
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
        responseId: maps[i]['response_id'],
        response: maps[i]['response'],
        responderId: maps[i]['responder_id'],
        questionId: maps[i]['question_id'],
      );
    });
  }
}
