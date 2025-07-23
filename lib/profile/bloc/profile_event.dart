part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteMovies extends ProfileEvent {}

class FavoriteMoviesUpdated extends ProfileEvent {
  const FavoriteMoviesUpdated(this.movies);

  final List<Movie> movies;

  @override
  List<Object> get props => [movies];
}
