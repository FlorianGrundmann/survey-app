import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/survey_element.dart';

abstract class SurveyDataRepository {
  Future<Either<Failure, Success>> saveSurveyData(List<SurveyElement> survey);
}
