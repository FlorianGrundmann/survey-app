import 'package:equatable/equatable.dart';

class ResponseOption<T> extends Equatable {
  final T value;

  ResponseOption([this.value]);

  @override
  List<Object> get props => [value];
}
