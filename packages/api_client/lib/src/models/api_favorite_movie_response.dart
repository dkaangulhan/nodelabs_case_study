import 'package:api_client/api_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_favorite_movie_response.freezed.dart';
part 'api_favorite_movie_response.g.dart';

/// Response of toggle operation to favorite/unfavorite a movie
@freezed
abstract class ApiFavoriteMovieResponse with _$ApiFavoriteMovieResponse {
  /// Response of toggle operation to favorite/unfavorite a movie
  const factory ApiFavoriteMovieResponse({
    required Movie movie,
    required ToggleFavoriteAction action,
  }) = _ApiFavoriteMovieResponse;

  /// Creates [ApiFavoriteMovieResponse] from json.
  factory ApiFavoriteMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiFavoriteMovieResponseFromJson(json);
}
