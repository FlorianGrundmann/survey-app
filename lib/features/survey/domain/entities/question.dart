import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String text;

  Question(this.text);

  @override
  List<Object> get props => [text];
}
