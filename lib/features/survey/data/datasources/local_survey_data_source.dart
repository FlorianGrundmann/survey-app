import '../../domain/entities/response.dart';

///Interface for local data source where the survey data (questions and given answers) are stored.
abstract class LocalSurveyDataSource {
  Future<void> saveSurveyData(List<Response> surveyData);
}
