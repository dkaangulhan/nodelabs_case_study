import 'dart:convert';
import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:api_client/src/models/api_favorite_movie_response.dart';
import 'package:dio/dio.dart';

/// {@template api_client}
/// Api client for exchanging data between client and backend.
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({Dio? dio}) {
    _dio = dio ?? Dio()
      ..interceptors.add(_ApiDioInterceptor());
  }

  late final Dio _dio;

  /// Set this with function that returns auth token.
  Future<String?> Function()? getAuthToken;

  Future<Map<String, dynamic>> _prepareHeaders(
    Map<String, dynamic> headers,
  ) async {
    final token = await getAuthToken?.call();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  /// Login operation.
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<ApiResponse>(
        ApiEndPoints.login,
        data: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      return LoginResponse.fromJson(
        response.data!.data! as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw error;
      }
      rethrow;
    }
  }

  /// Login operation.
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _dio.post<ApiResponse>(
        ApiEndPoints.register,
        data: jsonEncode(
          {
            'email': email,
            'name': name,
            'password': password,
          },
        ),
      );
      return RegisterResponse.fromJson(
        response.data!.data! as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw error;
      }
      rethrow;
    }
  }

  /// Upload photo
  Future<String> uploadPhoto({required File file}) async {
    try {
      final headers = await _prepareHeaders({});
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: 'photo.jpg',
        ),
      });
      final response = await _dio.post<ApiResponse>(
        ApiEndPoints.uploadPhoto,
        options: Options(
          headers: headers,
          contentType: 'multipart/form-data',
        ),
        data: formData,
      );
      return (response.data!.data! as Map<String, dynamic>)['photoUrl']
          as String;
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw error;
      }
      if (e.response?.statusCode == 413) {
        throw EntityTooLargeException();
      }
      rethrow;
    }
  }

  /// List movies.
  Future<ApiMovieListResponse> listMovies({
    int page = 1,
  }) async {
    try {
      final headers = await _prepareHeaders({});
      final response = await _dio.get<ApiResponse>(
        ApiEndPoints.list,
        options: Options(
          headers: headers,
        ),
        queryParameters: {'page': page},
      );
      return ApiMovieListResponse.fromJson(
        response.data!.data! as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw error;
      }
      rethrow;
    }
  }

  /// Get favorite movies.
  Future<List<Movie>> getFavoriteMovies() async {
    try {
      final headers = await _prepareHeaders({});
      final response = await _dio.get<ApiResponse>(
        ApiEndPoints.favorites,
        options: Options(
          headers: headers,
        ),
      );
      return (response.data!.data! as List<dynamic>).map((element) {
        return Movie.fromJson(element as Map<String, dynamic>);
      }).toList();
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw error;
      }
      rethrow;
    }
  }

  /// Toggle favorite movie.
  Future<ApiFavoriteMovieResponse> favoriteMovie(
    String id,
  ) async {
    try {
      final headers = await _prepareHeaders({});

      final response = await _dio.post<ApiResponse>(
        '${ApiEndPoints.toggleFavorite}/$id',
        options: Options(
          headers: headers,
        ),
      );
      return ApiFavoriteMovieResponse.fromJson(
        response.data!.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw EntityTooLargeException();
      }
      rethrow;
    }
  }
}

class _ApiDioInterceptor implements Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    try {
      final apiResponseError = ApiResponseException.fromJson(
        err.response!.data as Map<String, dynamic>,
      );
      throw apiResponseError;
    } on ApiResponseException {
      rethrow;
    } catch (e) {
      throw err;
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(
      Response(
        requestOptions: response.requestOptions,
        data: ApiResponse.fromJson(
          response.data as Map<String, dynamic>,
        ),
      ),
    );
  }
}
