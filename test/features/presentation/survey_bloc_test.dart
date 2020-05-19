import 'package:flutter_test/flutter_test.dart';
import 'package:survey_app/features/survey/presentation/bloc/survey_bloc.dart';

void main() {
  SurveyBloc bloc;

  setUp(() {
    bloc = SurveyBloc();
  });

  group('Initial state.', () {
    test('Initial state is GreetingState.', () async {
      //assert
      expect(bloc.initialState, GreetingState());
    });
  });
}
