// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_favorite_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiFavoriteMovieResponse _$ApiFavoriteMovieResponseFromJson(
        Map<String, dynamic> json) =>
    _ApiFavoriteMovieResponse(
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      action: $enumDecode(_$ToggleFavoriteActionEnumMap, json['action']),
    );

Map<String, dynamic> _$ApiFavoriteMovieResponseToJson(
        _ApiFavoriteMovieResponse instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'action': _$ToggleFavoriteActionEnumMap[instance.action]!,
    };

const _$ToggleFavoriteActionEnumMap = {
  ToggleFavoriteAction.favorited: 'favorited',
  ToggleFavoriteAction.unfavorited: 'unfavorited',
};
