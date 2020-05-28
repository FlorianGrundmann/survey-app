import '../../domain/entities/response_option.dart';
import 'question_data.dart';

class RatingQuestion extends QuestionData {
  RatingQuestion(String text, String id)
      : super(
          id: id,
          text: text,
          responseOptions: [
            ResponseOption(
              FourPointRatings.StrongNo,
              displayText: 'Trifft nicht zu',
            ),
            ResponseOption(
              FourPointRatings.No,
              displayText: 'Trifft etwas zu',
            ),
            ResponseOption(
              FourPointRatings.Yes,
              displayText: 'Trifft ziemlich zu',
            ),
            ResponseOption(
              FourPointRatings.StrongYes,
              displayText: 'Trifft stark zu',
            ),
          ],
        );
}

enum FourPointRatings {
  StrongNo,
  No,
  Yes,
  StrongYes,
}
