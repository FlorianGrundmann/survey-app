import 'package:equatable/equatable.dart';

class ResponseOption<T> extends Equatable {
  final T value;
  final String _displayText;

  get displayText => _displayText ?? value;

  ResponseOption(
    this.value, {
    String displayText,
  }) : _displayText = displayText;

  @override
  List<Object> get props => [value, _displayText];
}
