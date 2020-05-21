import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/survey_element.dart';
import '../../domain/repositories/survey_data_repository.dart';
import '../datasources/local_survey_data_source.dart';

class SurveyDataRepositoryImpl implements SurveyDataRepository {
  final LocalSurveyDataSource localDataSource;

  SurveyDataRepositoryImpl({this.localDataSource});

  @override
  Future<Either<Failure, Success>> saveSurveyData(List<SurveyElement> survey) {
    localDataSource.saveSurveyData(); //dummy implementation
    //TODO full implementation
  }
}
