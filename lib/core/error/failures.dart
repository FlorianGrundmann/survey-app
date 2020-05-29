import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class Success extends Equatable {
  @override
  List<Object> get props => [];
}

///General local data source failure.
///Use a more specific failure whenever possible.
class LocalDataSourceFailure extends Failure {
  final String message;

  LocalDataSourceFailure([this.message]);
}

class MappingFailure extends Failure {
  final String message;

  MappingFailure([this.message]);
}
