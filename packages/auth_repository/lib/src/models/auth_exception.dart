/// These are possible auth exceptions.
sealed class AuthException implements Exception {}

/// Thrown when credentials are invalid.
class InvalidCredentials extends AuthException {}

/// Thrown when user exists.
class UserExists extends AuthException {}
