import 'local_survey_data_source.dart';

class DummySurveyDataSource implements LocalSurveyDataSource {
  @override
  Future<void> saveSurveyData() {
    // does nothing
  }
}
