// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiMovieListResponse _$ApiMovieListResponseFromJson(
        Map<String, dynamic> json) =>
    _ApiMovieListResponse(
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiMovieListResponseToJson(
        _ApiMovieListResponse instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'pagination': instance.pagination,
    };
