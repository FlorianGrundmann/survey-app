import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/survey_data.dart';

abstract class SurveyDataRepository {
  Future<Either<Failure, Success>> saveSurveyData(SurveyData data);
}
