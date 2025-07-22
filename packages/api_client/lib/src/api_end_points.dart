// ignore_for_file: public_member_api_docs

/// Api end points
abstract class ApiEndPoints {
  static const String _baseUrl = 'https://caseapi.servicelabs.tech';

  /// user
  static const String login = '$_baseUrl/user/login';
  static const String register = '$_baseUrl/user/register';
}
