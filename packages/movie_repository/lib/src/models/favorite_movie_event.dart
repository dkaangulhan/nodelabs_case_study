// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

sealed class FavoriteMovieEvent extends Equatable {
  const FavoriteMovieEvent({
    required this.movie,
  });

  final Movie movie;
  @override
  List<Object?> get props => [];
}

class MovieFavorited extends FavoriteMovieEvent {
  const MovieFavorited({
    required super.movie,
  });

  @override
  List<Object?> get props => [movie];
}

class MovieUnfavorited extends FavoriteMovieEvent {
  const MovieUnfavorited({
    required super.movie,
  });

  @override
  List<Object?> get props => [movie];
}
