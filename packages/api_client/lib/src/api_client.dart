import 'dart:convert';

import 'package:api_client/src/api_end_points.dart';
import 'package:api_client/src/models/api_response.dart';
import 'package:api_client/src/models/api_response_exception.dart';
import 'package:api_client/src/models/login_response.dart';
import 'package:api_client/src/models/register_response.dart';
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
        response.data!.data!,
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
        response.data!.data!,
      );
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiResponseException) {
        throw error;
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
    final apiResponseError = ApiResponseException.fromJson(
      err.response!.data as Map<String, dynamic>,
    );
    throw apiResponseError;
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
    handler.resolve(
      Response(
        requestOptions: response.requestOptions,
        data: ApiResponse.fromJson(
          response.data as Map<String, dynamic>,
        ),
      ),
    );
  }
}
