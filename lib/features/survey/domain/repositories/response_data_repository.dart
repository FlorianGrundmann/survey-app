import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/response.dart';

abstract class ResponseDataRepository {
  Future<Either<Failure, Success>> saveResponse(List<Response> response);
  Future<Either<Failure, Success>> exportAll();
}
