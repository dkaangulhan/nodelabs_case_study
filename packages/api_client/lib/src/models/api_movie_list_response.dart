import 'package:api_client/src/models/movie.dart';
import 'package:api_client/src/models/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_movie_list_response.freezed.dart';
part 'api_movie_list_response.g.dart';

/// Api response for list movie operation.
@freezed
abstract class ApiMovieListResponse with _$ApiMovieListResponse {
  /// Api response for list movie operation.
  const factory ApiMovieListResponse({
    required List<Movie>? movies,
    required Pagination pagination,
  }) = _ApiMovieListResponse;

  /// Creates [ApiMovieListResponse] from json.
  factory ApiMovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMovieListResponseFromJson(json);
}
