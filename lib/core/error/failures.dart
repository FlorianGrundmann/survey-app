import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
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

  @override
  List<Object> get props => [message];
}
