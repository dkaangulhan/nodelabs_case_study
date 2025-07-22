import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(
          const FeedState(
            movies: [],
            currentPage: null,
            totalCount: null,
            maxPage: null,
          ),
        ) {
    on<RequestNextPage>(_onRequestMovies);
    on<RefreshMovies>(_onRefreshMovies);
  }

  final MovieRepository _movieRepository;

  bool get reachedMaxPage =>
      state.maxPage != null && state.maxPage == state.currentPage;

  FutureOr<void> _onRequestMovies(
    RequestNextPage event,
    Emitter<FeedState> emit,
  ) async {
    if (state is FeedLoading || reachedMaxPage) {
      return;
    }
    final currentPage = state.currentPage;
    final loadingPage = currentPage != null ? currentPage + 1 : 1;
    emit(
      FeedLoading(
        loadingPage: loadingPage,
        currentPage: currentPage,
        movies: state.movies,
        totalCount: state.totalCount,
        maxPage: state.maxPage,
      ),
    );
    final result = await _movieRepository.listMovies(
      page: loadingPage,
    );
    final movies = [...state.movies, ...result.$1];
    emit(
      FeedState(
        movies: movies,
        currentPage: loadingPage,
        totalCount: result.$2.totalCount,
        maxPage: result.$2.maxPage,
      ),
    );
  }

  FutureOr<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<FeedState> emit,
  ) async {
    if (state is FeedLoading) {
      return;
    }
    const currentPage = 0;
    const loadingPage = currentPage + 1;
    emit(
      const FeedLoading(
        loadingPage: loadingPage,
        currentPage: currentPage,
        movies: [],
        totalCount: null,
        maxPage: null,
      ),
    );
    final result = await _movieRepository.listMovies();
    final movies = [...state.movies, ...result.$1];
    emit(
      FeedState(
        movies: movies,
        currentPage: loadingPage,
        totalCount: result.$2.totalCount,
        maxPage: result.$2.maxPage,
      ),
    );
  }
}
