import 'dart:async';

import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/config/app_analytics_event.dart';
import 'package:user_repository/user_repository.dart';

part 'favorite_toggle_button_state.dart';

class FavoriteToggleButtonCubit extends Cubit<FavoriteToggleButtonState> {
  FavoriteToggleButtonCubit({
    required Movie movie,
    required MovieRepository movieRepository,
    required AnalyticsRepository analyticsRepository,
    required UserRepository userRepository,
  })  : _movieRepository = movieRepository,
        _analyticsRepository = analyticsRepository,
        _userRepository = userRepository,
        super(
          FavoriteToggleButtonState(
            movie: movie,
          ),
        ) {
    _favoriteMovieSubscription =
        _movieRepository.favoriteMovieStream.listen(_onFavoriteMovieEvent);
  }

  final MovieRepository _movieRepository;
  final AnalyticsRepository _analyticsRepository;
  final UserRepository _userRepository;
  late final StreamSubscription<FavoriteMovieEvent> _favoriteMovieSubscription;

  void toggleFavorite() {
    _movieRepository.toggleFavoriteMovie(state.movie);
    if (state.movie.isFavorite == false) {
      _analyticsRepository.trackEvent(
        MovieLikedAnalyticsEvent(
          movieName: state.movie.title!,
          userId: _userRepository.user!.id,
        ),
      );
    }
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
