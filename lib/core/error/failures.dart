import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class Success extends Equatable {
  @override
  List<Object> get props => [];
}

//General failures
class LocalDataSourceFailure extends Failure {}
