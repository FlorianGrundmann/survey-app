import 'package:survey_app/features/survey/data/model/response_data.dart';

import 'local_survey_data_source.dart';

///! Data source which does nothing!
///This data source should only be used for testing purposes.
class DummySurveyDataSource implements LocalSurveyDataSource {
  @override
  Future<void> saveSurveyData(List<ResponseData> responses) async {
    //* Do nothing
  }
}
