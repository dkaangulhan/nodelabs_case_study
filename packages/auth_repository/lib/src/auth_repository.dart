import 'package:api_client/api_client.dart';
import 'package:auth_repository/src/models/models.dart';

/// {@template auth_repository}
/// Auth repository to manage authentication data.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository(this._apiClient);
  final ApiClient _apiClient;

  /// Currently logged in user. If null
  /// no user has logged in.
  String? get token => _token;
  String? _token;

  /// Logs user in with provided [email] and [password].
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponse = await _apiClient.login(
        email: email,
        password: password,
      );
      _token = loginResponse.token;
      return loginResponse;
    } on ApiResponseException catch (e) {
      if (e.response.message == ApiErrors.invalidCredentials) {
        throw InvalidCredentials();
      }
      rethrow;
    }
  }
}
