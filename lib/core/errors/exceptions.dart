// ignore_for_file: public_member_api_docs, sort_constructors_first

class ServerException implements Exception {}

class AuthException implements Exception {
  String message;
  AuthException({
    required this.message,
  });
}

class UnAuthenticatedException implements Exception {
  String message;
  UnAuthenticatedException({
    required this.message,
  });
}

class UnVerifiedException implements Exception {
  String message;
  UnVerifiedException({
    required this.message,
  });
}

class ExpiredPlanException implements Exception {
  String message;
  dynamic result;
  ExpiredPlanException({
    required this.message,
    required this.result,
  });
}

class NetworkException implements Exception {}

class EmptyCacheException implements Exception {}

class UnExpectedException implements Exception {}

class ValidationException implements Exception {
  String message;
  ValidationException({
    required this.message,
  });
}
