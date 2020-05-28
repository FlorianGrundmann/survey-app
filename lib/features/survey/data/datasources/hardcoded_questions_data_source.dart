import '../model/rating_question_model.dart';
import 'local_question_data_source.dart';

///Data source that returns data which is hardcoded.
///To change the data, the code of this class needs to be changed too.
class HardCodedQuestionsDataSource implements LocalQuestionDataSource {
  @override
  Future<List<RatingQuestionModel>> loadAllQuestions() async {
    return [
      RatingQuestionModel(
        'Der Ablauf der Anästhesie sollte besser erläutert werden.',
      ),
      RatingQuestionModel(
          'Es wurde zu wenig über die Risiken der bevorstehenden Anästhesie informiert.'),
      RatingQuestionModel(
        'Ich empfand das Video insgesamt als verständlich.',
      ),
      RatingQuestionModel(
        'Das Video war insgesamt von guter Qualität.',
      ),
      RatingQuestionModel(
        'Das Video war zu lang.',
      ),
      RatingQuestionModel(
        'Die Bilder und Texte halfen mir den Information besser zu folgen.',
      ),
      RatingQuestionModel(
        'Es war zu viel Text auf den Folien.',
      ),
      RatingQuestionModel('Die Stimme des Sprechers war angenehm.'),
      RatingQuestionModel(
        'Der Sprecher sprach zu schnell oder undeutlich.',
      ),
      RatingQuestionModel(
        'Ich habe das Gefühl ernst genommen zu werden.',
      ),
      RatingQuestionModel(
        'Ich wünsche mir mehr videounterstützte Aufklärung.',
      ),
      RatingQuestionModel(
        'Wartezeiten konnten durch die videounterstützte Aufklärung sinnvoll genutzt werden.',
      ),
      RatingQuestionModel(
        'Ich bin mit der videounterstützten Aufklärung zufrieden.',
      ),
    ];
  }
}
