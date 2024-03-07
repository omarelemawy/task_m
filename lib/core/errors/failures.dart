// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final dynamic result;
  const Failure({
    this.message,
    this.result,
  });
}

class UnVerifiedFailure extends Failure {
  const UnVerifiedFailure({
    required super.message,
  });
  @override
  List<Object?> get props => [];
}

class ExpiredPlanFailure extends Failure {
  const ExpiredPlanFailure({
    required super.message,
    required super.result,
  });
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
  });
  @override
  List<Object?> get props => [];
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure({
    super.message = '',
  });

  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
  });
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
    required super.message,
  });
  @override
  List<Object?> get props => [];
}

class UnExpectedFailure extends Failure {
  const UnExpectedFailure({
    required super.message,
  });
  @override
  List<Object?> get props => [];
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
  });
  @override
  List<Object?> get props => [];
}
