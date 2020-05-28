import 'response_option.dart';

import 'question.dart';

class RatingQuestion extends Question {
  RatingQuestion(text)
      : super(
          questionText: text,
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
