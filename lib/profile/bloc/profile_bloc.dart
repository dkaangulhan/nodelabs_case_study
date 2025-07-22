import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(
          const ProfileState(
            favoriteMovies: [],
            favoriteMoviesState: FavoriteMoviesState.initial,
          ),
        ) {
    on<LoadFavoriteMovies>(_onLoadFavoriteMovies);
  }
  final MovieRepository _movieRepository;

  FutureOr<void> _onLoadFavoriteMovies(
    LoadFavoriteMovies event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        favoriteMoviesState: FavoriteMoviesState.loading,
      ),
    );
    await _movieRepository.getFavoriteMovies();
    emit(
      state.copyWith(
        favoriteMovies: _movieRepository.favoriteMovies,
        favoriteMoviesState: FavoriteMoviesState.loaded,
      ),
    );
  }
}
