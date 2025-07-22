import 'package:api_client/api_client.dart';

/// {@template movie_repository}
/// Movie repository for managing movies.
/// {@endtemplate}
class MovieRepository {
  /// {@macro movie_repository}
  const MovieRepository(this._apiClient);

  final ApiClient _apiClient;

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
}
