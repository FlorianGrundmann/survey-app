import '../model/survey_element_model.dart';
import 'local_question_data_source.dart';

///Data source that returns data which is hardcoded.
///To change the data, the code of this class needs to be changed too.
class HardCodedQuestionsDataSource implements LocalQuestionDataSource {
  @override
  Future<List<SurveyElementModel>> loadAllQuestions() async {
    return [
      SurveyElementModel(
        'Der Ablauf der Anästhesie sollte besser erläutert werden.',
      ),
      SurveyElementModel(
          'Es wurde zu wenig über die Risiken der bevorstehenden Anästhesie informiert.'),
      SurveyElementModel(
        'Ich empfand das Video insgesamt als verständlich.',
      ),
      SurveyElementModel(
        'Das Video war insgesamt von guter Qualität.',
      ),
      SurveyElementModel(
        'Das Video war zu lang.',
      ),
      SurveyElementModel(
        'Die Bilder und Texte halfen mir den Information besser zu folgen.',
      ),
      SurveyElementModel(
        'Es war zu viel Text auf den Folien.',
      ),
      SurveyElementModel('Die Stimme des Sprechers war angenehm.'),
      SurveyElementModel(
        'Der Sprecher sprach zu schnell oder undeutlich.',
      ),
      SurveyElementModel(
        'Ich habe das Gefühl ernst genommen zu werden.',
      ),
      SurveyElementModel(
        'Ich wünsche mir mehr videounterstützte Aufklärung.',
      ),
      SurveyElementModel(
        'Wartezeiten konnten durch die videounterstützte Aufklärung sinnvoll genutzt werden.',
      ),
      SurveyElementModel(
        'Ich bin mit der videounterstützten Aufklärung zufrieden.',
      ),
    ];
  }
}
