import 'package:get_it/get_it.dart';

import 'features/survey/data/datasources/dummy_survey_data_source.dart';
import 'features/survey/data/datasources/hardcoded_questions_data_source.dart';
import 'features/survey/data/datasources/local_question_data_source.dart';
import 'features/survey/data/datasources/local_survey_data_source.dart';
import 'features/survey/data/repositories/questions_repository_impl.dart';
import 'features/survey/data/repositories/survey_data_repository_impl.dart';
import 'features/survey/domain/repositories/questions_repository.dart';
import 'features/survey/domain/repositories/response_data_repository.dart';
import 'features/survey/domain/usecases/start_survey_usecase.dart';
import 'features/survey/domain/usecases/submit_survey_usecase.dart';
import 'features/survey/presentation/bloc/survey_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc
  sl.registerFactory(
    () => SurveyBloc(
      startSurveyUseCase: sl(),
      submitResponseUseCase: sl(),
    ),
  );

  //Use cases
  sl.registerLazySingleton(() => StartSurveyUseCase(repository: sl()));
  sl.registerLazySingleton(() => SubmitResponseUseCase(repository: sl()));

  //Repositories
  sl.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<ResponseDataRepository>(
      () => SurveyDataRepositoryImpl(localDataSource: sl()));

  //Data
  sl.registerLazySingleton<LocalQuestionDataSource>(
      () => HardCodedQuestionsDataSource());
  sl.registerLazySingleton<LocalSurveyDataSource>(
      () => DummySurveyDataSource());
}
