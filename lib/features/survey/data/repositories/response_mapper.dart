import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:survey_app/core/error/exceptions.dart';
import 'package:survey_app/features/survey/domain/entities/rating_question.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/response.dart';
import '../model/response_data.dart';

class ResponseMapper {
  List<ResponseData> mapToResponseData(List<Response> responses) {
    var uuid = Uuid();
    List<ResponseData> result = [];
    for (Response response in responses) {
      result.add(ResponseData(
        questionId: response.questionRespondedTo.id,
        responseId: uuid.v1(),
        responderId: response.responderId,
        response: _mapResponseValue(response.selectedResponse.value),
      ));
    }
    return result;
  }

  Future<String> mapToCsv(List<ResponseData> responseData) async {
    String header = 'response_id; response; question_id; responder_id';
    String entries = '';
    for (int i = 0; i < responseData.length; i++) {
      entries += '\n'
          '${responseData[i].responseId}; '
          '${responseData[i].response}; '
          '${responseData[i].questionId}; '
          '${responseData[i].responderId}';
    }

    return header + entries;
  }

  Future<File> mapCsvToFile(String csvString, String filename) async {
    Directory tempDirectory = await getTemporaryDirectory();
    return File('${tempDirectory.path}/$filename').writeAsString(csvString);
  }

  _mapResponseValue(dynamic value) {
    if (value is FourPointRatings) {
      return _mapFourPointRating(value);
    } else {
      throw new UnknownResponseOptionType();
    }
  }

  String _mapFourPointRating(FourPointRatings rating) {
    switch (rating) {
      case FourPointRatings.StrongNo:
        return '0';
        break;
      case FourPointRatings.No:
        return '1';
        break;
      case FourPointRatings.Yes:
        return '2';
        break;
      case FourPointRatings.StrongYes:
        return '3';
        break;
      default:
        throw new UnknownResponseOptionType();
    }
  }
}
