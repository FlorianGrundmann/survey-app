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
          'CREATE TABLE questions(question_id TEXT PRIMARY KEY, question_text TEXT, type TEXT);'
          'CREATE TABLE responses(response_id TEXT PRIMARY KEY, response TEXT, responder_id TEXT, question_id TEXT, FOREIGN KEY(question_id) REFERENCES questions(question_id));'
          'INSERT INTO questions(question_id, question_text, type) '
          'VALUES '
          '("a726506a-a0cc-11ea-bb37-0242ac130002", "Der Ablauf der Anästhesie sollte besser erläutert werden.", "four_point_rating")'
          '("a72653ee-a0cc-11ea-bb37-0242ac130002", "Es wurde zu wenig über die Risiken der bevorstehenden Anästhesie informiert.", "four_point_rating")'
          '("a72654e8-a0cc-11ea-bb37-0242ac130002", "Ich empfand das Video insgesamt als verständlich.", "four_point_rating")'
          '("a72655b0-a0cc-11ea-bb37-0242ac130002", "Das Video war insgesamt von guter Qualität.", "four_point_rating")'
          '("a726566e-a0cc-11ea-bb37-0242ac130002", "Das Video war zu lang.", "four_point_rating")'
          '("a7265722-a0cc-11ea-bb37-0242ac130002", "Die Bilder und Texte halfen mir den Information besser zu folgen.", "four_point_rating")'
          '("a7265bc8-a0cc-11ea-bb37-0242ac130002", "Es war zu viel Text auf den Folien.", "four_point_rating")'
          '("a7265cfe-a0cc-11ea-bb37-0242ac130002", "Die Stimme des Sprechers war angenehm.", "four_point_rating")'
          '("a7265dbc-a0cc-11ea-bb37-0242ac130002", "Der Sprecher sprach zu schnell oder undeutlich.", "four_point_rating")'
          '("a7265e7a-a0cc-11ea-bb37-0242ac130002", "Ich habe das Gefühl ernst genommen zu werden.", "four_point_rating")'
          '("a7265f2e-a0cc-11ea-bb37-0242ac130002", "Ich wünsche mir mehr videounterstützte Aufklärung.", "four_point_rating")'
          '("a7265fe2-a0cc-11ea-bb37-0242ac130002", "Wartezeiten konnten durch die videounterstützte Aufklärung sinnvoll genutzt werden.", "four_point_rating")'
          '("a72662f8-a0cc-11ea-bb37-0242ac130002", "Ich bin mit der videounterstützten Aufklärung zufrieden.", "four_point_rating")'
          ';',
        );
      },
      version: 2,
    );
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
        questionId: maps[i]['question_id'],
        responderId: maps[i]['responder_id'],
        response: maps[i]['response'],
        responseId: maps[i]['response_id'],
      );
    });
  }
}
