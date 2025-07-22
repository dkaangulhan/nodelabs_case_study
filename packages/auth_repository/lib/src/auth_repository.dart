import 'package:api_client/api_client.dart';
import 'package:auth_repository/src/models/models.dart';

/// {@template auth_repository}
/// Auth repository to manage authentication data.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository(this._apiClient) {
    _apiClient.getAuthToken = _getAuthToken;
  }
  final ApiClient _apiClient;

  /// Currently logged in user. If null
  /// no user has logged in.
  String? get token => _token;
  String? _token;

  /// Updates token
  // ignore: use_setters_to_change_properties
  void putToken(String? token) {
    _token = token;
  }

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

  /// Register with provided [email], [password] and [name].
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final registerResponse = await _apiClient.register(
        email: email,
        password: password,
        name: name,
      );
      _token = registerResponse.token;
      return registerResponse;
    } on ApiResponseException catch (e) {
      if (e.response.message == ApiErrors.userExists) {
        throw UserExists();
      }
      rethrow;
    }
  }

  Future<String?> _getAuthToken() async => _token;
}
