// ignore_for_file: public_member_api_docs

/// Api end points
abstract class ApiEndPoints {
  static const String _baseUrl = 'https://caseapi.servicelabs.tech';

  /// user
  static const String login = '$_baseUrl/user/login';
  static const String register = '$_baseUrl/user/register';
  static const String uploadPhoto = '$_baseUrl/user/upload_photo';

  /// movies
  static const String list = '$_baseUrl/movie/list';
  static const String favorites = '$_baseUrl/movie/favorites';
  static const String toggleFavorite = '$_baseUrl/movie/favorite';
}
