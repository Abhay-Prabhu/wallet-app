class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class TokenNotFoundException implements Exception {
  final String message;
  TokenNotFoundException(this.message);
}

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);

  @override
  String toString() => 'AuthenticationException: $message';
}