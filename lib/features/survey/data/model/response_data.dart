import 'package:equatable/equatable.dart';

class ResponseData<T> extends Equatable {
  final String questionId;
  final String responseId;
  final T response;

  ResponseData({
    this.questionId,
    this.responseId,
    this.response,
  });

  @override
  List<Object> get props => [questionId, responseId, response];
}
