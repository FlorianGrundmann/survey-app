import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int answerIndex;

  Answer([this.answerIndex]);

  @override
  List<Object> get props => [answerIndex];
}
