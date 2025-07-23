// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:api_client/api_client.dart';
import 'package:movie_repository/src/models/favorite_movie_event.dart';
import 'package:rxdart/subjects.dart';

/// {@template movie_repository}
/// Movie repository for managing movies.
/// {@endtemplate}
class MovieRepository {
  /// {@macro movie_repository}
  MovieRepository(this._apiClient);

  final ApiClient _apiClient;

  // ignore: public_member_api_docs
  Stream<FavoriteMovieEvent> get favoriteMovieStream =>
      _favoriteMovieSubject.stream;

  final _favoriteMovieSubject = PublishSubject<FavoriteMovieEvent>();

  /// User's favorite movies.
  List<Movie> get favoriteMovies => _favoriteMovies;
  final List<Movie> _favoriteMovies = [];

  /// To list the movies.
  Future<
      (
        List<Movie> movies,
        ({
          int totalCount,
          int maxPage,
          int currentPage,
        })
      )> listMovies({
    int page = 1,
  }) async {
    final response = await _apiClient.listMovies(page: page);
    final movies = response.movies ?? [];
    final pagination = (
      totalCount: response.pagination.totalCount,
      maxPage: response.pagination.maxPage,
      currentPage: response.pagination.currentPage,
    );
    return (movies, pagination);
  }

  /// Get user's favorite movies.
  Future<void> getFavoriteMovies() async {
    final response = await _apiClient.getFavoriteMovies();
    _favoriteMovies
      ..clear()
      ..addAll(response);
  }

  /// Toggle favorite movie.
  Future<void> toggleFavoriteMovie(Movie movie) async {
    if (movie.isFavorite == false) {
      _addFavorite(movie.copyWith(isFavorite: true));
    }
    if (movie.isFavorite == true) {
      _removeFavorite(movie.copyWith(isFavorite: false));
    }
    final response = await _apiClient.favoriteMovie(movie.id!);
    switch (response.action) {
      case ToggleFavoriteAction.favorited:
        _addFavorite(response.movie);
      case ToggleFavoriteAction.unfavorited:
        _removeFavorite(response.movie);
    }
  }

  void _addFavorite(Movie movie) {
    final index = _favoriteMovies.indexWhere((element) {
      return element.id == movie.id;
    });
    if (index == -1 && movie.isFavorite == true) {
      _favoriteMovies.add(movie);
      _favoriteMovieSubject.add(MovieFavorited(movie: movie));
    }
  }

  void _removeFavorite(Movie movie) {
    final index = _favoriteMovies.indexWhere((element) {
      return element.id == movie.id;
    });
    if (index != -1 && movie.isFavorite == false) {
      _favoriteMovies.removeAt(index);
      _favoriteMovieSubject.add(MovieUnfavorited(movie: movie));
    }
  }
}
