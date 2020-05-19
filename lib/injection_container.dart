import 'package:get_it/get_it.dart';
import 'package:survey_app/features/survey/data/datasources/hardcoded_questions_data_source.dart';
import 'package:survey_app/features/survey/data/datasources/local_data_source.dart';
import 'package:survey_app/features/survey/data/repositories/questions_repository_impl.dart';
import 'package:survey_app/features/survey/domain/repositories/questions_repository.dart';
import 'package:survey_app/features/survey/domain/usecases/start_survey_usecase.dart';

import 'features/survey/presentation/bloc/survey_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc
  sl.registerFactory(
    () => SurveyBloc(),
  );

  //Use cases
  sl.registerLazySingleton(() => StartSurveyUsecase());

  //Repositories
  sl.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositoryImpl());

  //Data
  sl.registerLazySingleton<LocalDataSource>(
      () => HardCodedQuestionsDataSource());
}
