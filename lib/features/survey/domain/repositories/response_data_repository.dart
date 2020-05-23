import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/survey_data.dart';

abstract class ResponseDataRepository {
  Future<Either<Failure, Success>> saveResponse(List<SurveyData> response);
}
