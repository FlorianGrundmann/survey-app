import '../../domain/entities/response.dart';
import 'local_survey_data_source.dart';

///! Data source which does nothing!
///This data source should only be used for testing purposes.
class DummySurveyDataSource implements LocalSurveyDataSource {
  @override
  Future<void> saveSurveyData(List<Response> survey) async {
    //* Do nothing
  }
}
