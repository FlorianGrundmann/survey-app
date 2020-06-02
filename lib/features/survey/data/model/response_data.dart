import 'package:equatable/equatable.dart';

class ResponseData extends Equatable {
  final String questionId;
  final String responseId;
  final String responderId;
  final String response;

  ResponseData({
    this.questionId,
    this.responseId,
    this.responderId,
    this.response,
  });

  @override
  List<Object> get props => [questionId, responseId, response, responderId];
}
