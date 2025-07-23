import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
    on<FavoriteMoviesUpdated>(_onFavoriteMoviesUpdated);
    _streamSubscription = _movieRepository.favoriteMovieStream.listen(
      _onFavoriteMovieEvent,
    );
  }
  final MovieRepository _movieRepository;

  late final StreamSubscription<FavoriteMovieEvent> _streamSubscription;

  FutureOr<void> _onLoadFavoriteMovies(
    LoadFavoriteMovies event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      ProfileState(
        favoriteMovies: List.from(_movieRepository.favoriteMovies),
        favoriteMoviesState: FavoriteMoviesState.loading,
      ),
    );
    await _movieRepository.getFavoriteMovies();
    emit(
      ProfileState(
        favoriteMovies: List.from(_movieRepository.favoriteMovies),
        favoriteMoviesState: FavoriteMoviesState.loaded,
      ),
    );
  }

  void _onFavoriteMoviesUpdated(
    FavoriteMoviesUpdated event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      ProfileState(
        favoriteMovies: event.movies,
        favoriteMoviesState: FavoriteMoviesState.loaded,
      ),
    );
  }

  void _onFavoriteMovieEvent(FavoriteMovieEvent event) {
    add(FavoriteMoviesUpdated(List.from(_movieRepository.favoriteMovies)));
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }
}
