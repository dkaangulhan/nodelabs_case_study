part of 'profile_bloc.dart';

enum FavoriteMoviesState {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  const ProfileState({
    required this.favoriteMovies,
    required this.favoriteMoviesState,
  });

  final List<Movie> favoriteMovies;
  final FavoriteMoviesState favoriteMoviesState;

  @override
  List<Object> get props => [favoriteMovies, favoriteMovies];

  ProfileState copyWith({
    List<Movie>? favoriteMovies,
    FavoriteMoviesState? favoriteMoviesState,
  }) {
    return ProfileState(
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      favoriteMoviesState: favoriteMoviesState ?? this.favoriteMoviesState,
    );
  }
}
