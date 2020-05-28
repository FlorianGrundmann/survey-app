import '../model/rating_question.dart';
import 'local_question_data_source.dart';

///Data source that returns data which is hardcoded.
///To change the data, the code of this class needs to be changed too.
class HardCodedQuestionsDataSource implements LocalQuestionDataSource {
  @override
  Future<List<RatingQuestion>> loadAllQuestions() async {
    return [
      RatingQuestion(
        'Der Ablauf der Anästhesie sollte besser erläutert werden.',
        'a726506a-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Es wurde zu wenig über die Risiken der bevorstehenden Anästhesie informiert.',
        'a72653ee-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Ich empfand das Video insgesamt als verständlich.',
        'a72654e8-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Das Video war insgesamt von guter Qualität.',
        'a72655b0-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Das Video war zu lang.',
        'a726566e-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Die Bilder und Texte halfen mir den Information besser zu folgen.',
        'a7265722-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Es war zu viel Text auf den Folien.',
        'a7265bc8-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Die Stimme des Sprechers war angenehm.',
        'a7265cfe-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Der Sprecher sprach zu schnell oder undeutlich.',
        'a7265dbc-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Ich habe das Gefühl ernst genommen zu werden.',
        'a7265e7a-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Ich wünsche mir mehr videounterstützte Aufklärung.',
        'a7265f2e-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Wartezeiten konnten durch die videounterstützte Aufklärung sinnvoll genutzt werden.',
        'a7265fe2-a0cc-11ea-bb37-0242ac130002',
      ),
      RatingQuestion(
        'Ich bin mit der videounterstützten Aufklärung zufrieden.',
        'a72662f8-a0cc-11ea-bb37-0242ac130002',
      ),
    ];
  }
}
