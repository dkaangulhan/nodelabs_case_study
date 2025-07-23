import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

part 'favorite_toggle_button_state.dart';

class FavoriteToggleButtonCubit extends Cubit<FavoriteToggleButtonState> {
  FavoriteToggleButtonCubit({
    required Movie movie,
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(
          FavoriteToggleButtonState(
            movie: movie,
          ),
        ) {
    _favoriteMovieSubscription =
        _movieRepository.favoriteMovieStream.listen(_onFavoriteMovieEvent);
  }

  final MovieRepository _movieRepository;
  late final StreamSubscription<FavoriteMovieEvent> _favoriteMovieSubscription;

  void toggleFavorite() {
    _movieRepository.toggleFavoriteMovie(state.movie);
  }

  void _onFavoriteMovieEvent(FavoriteMovieEvent event) {
    if (event.movie.id == state.movie.id) {
      emit(state.copyWith(movie: event.movie));
    }
  }

  @override
  Future<void> close() async {
    await _favoriteMovieSubscription.cancel();
    return super.close();
  }
}
