import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/answer.dart';

abstract class SurveyDataRepository {
  Future<Either<Failure, Success>> saveSurveyData(Answer data);
}
