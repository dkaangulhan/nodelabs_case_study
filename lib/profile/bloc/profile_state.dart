part of 'profile_bloc.dart';

enum FavoriteMoviesState {
  initial,
  loading,
  loaded,
  error,
}

@immutable
class ProfileState extends Equatable {
  const ProfileState({
    required this.favoriteMovies,
    required this.favoriteMoviesState,
  });

  final List<Movie> favoriteMovies;
  final FavoriteMoviesState favoriteMoviesState;

  @override
  List<Object> get props => [favoriteMovies, favoriteMoviesState];
}
